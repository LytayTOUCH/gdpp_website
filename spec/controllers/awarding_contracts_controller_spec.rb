require 'rails_helper'
include ControllerHelpers

RSpec.describe AwardingContractsController, type: :controller do
  login_admin

  describe "GET #AwardingContractController" do
    context '#index' do
      it "populates an array of AwardingContract" do
        awarding_contract_one = create(:awarding_contract, 
        title: 'Awarding Contract 1', description: 'description 1', procurement_method_id: ProcurementMethod.find_or_create_by(attributes_for(:procurement_method)).id)
        awarding_contract_two = create(:awarding_contract, 
        title: 'Awarding Contract 2', description: 'description 2', procurement_method_id: ProcurementMethod.find_or_create_by(attributes_for(:procurement_method)).id)
        get :index
        expect(assigns(:awarding_contracts)).to match_array([awarding_contract_one, awarding_contract_two])
      end
      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end

    context "#new" do
      it "assigns a new AwardingContract to @awarding_contract" do
        get :new
        expect(assigns(:awarding_contract)).to be_a_new(AwardingContract)
      end
      it "renders the :new template" do 
        get :new
        expect(response).to render_template :new
      end
    end

    context "#edit" do
      it "assigns the requested an AwardingContract to @awarding_contract" do
        awarding_contract = create(:awarding_contract)
        get :edit, id: awarding_contract
        expect(assigns(:awarding_contract)).to eq(awarding_contract)
      end
      it "renders the :edit template" do
        awarding_contract = create(:awarding_contract)
        get :edit, id: awarding_contract
        expect(response).to render_template :edit
      end
    end
  end

  describe "POST #create" do

    context "with valid attributes" do
      it "saves the new Awarding Contract in the database" do
        expect{ 
          post :create, awarding_contract: attributes_for(:awarding_contract)
        }.to change(AwardingContract, :count).by(1)
      end

      it "redirects to awarding_contracts#index" do
        post :create, awarding_contract: attributes_for(:awarding_contract)
        expect(response).to redirect_to awarding_contracts_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new Awarding Contract in the database" do
        expect{
          post :create, awarding_contract: attributes_for(:invalid_awarding_contract)
        }.to_not change(AwardingContract, :count)
      end

      it "re-renders the :new template" do
        post :create, awarding_contract: attributes_for(:invalid_awarding_contract)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      @awarding_contract = FactoryGirl.create(:awarding_contract, 
        title: "Awarding Contract 1", description: 'description 1', procurement_method_id: ProcurementMethod.find_or_create_by(attributes_for(:procurement_method)).id)
    end

    it "locates the requested @awarding_contract" do
      put :update, id: @awarding_contract, 
      awarding_contract: FactoryGirl.attributes_for(:awarding_contract)
      expect(assigns(:awarding_contract)).to eq(@awarding_contract)
    end

    context "with valid attributes" do
      it "changes @awarding_contract's attributes" do
        put :update, id: @awarding_contract, awarding_contract: FactoryGirl.attributes_for(:awarding_contract,
            title: "Change to Awarding Contract 2", description: 'description 2', procurement_method_id: ProcurementMethod.find_or_create_by(attributes_for(:procurement_method)).id)
        @awarding_contract.reload
        expect(@awarding_contract.title).to eq("Change to Awarding Contract 2")
      end
      it "redirects to the updated Awarding Contract" do
        put :update, id: @awarding_contract, 
          awarding_contract: FactoryGirl.attributes_for(:awarding_contract)
        expect(response).to redirect_to awarding_contracts_path
      end
    end

    context "with invalid attributes" do
      it "does not change @awarding_contract's attributes" do
        put :update, id: @awarding_contract,
          awarding_contract: FactoryGirl.attributes_for(:awarding_contract,
            title: nil, description: 'description 1', procurement_method_id: ProcurementMethod.find_or_create_by(attributes_for(:procurement_method)).id)
        @awarding_contract.reload
        expect(@awarding_contract.title).to eq("Awarding Contract 1")
      end
      it "re-renders the edit method" do
        put :update, id: @awarding_contract, 
          awarding_contract: FactoryGirl.attributes_for(:invalid_awarding_contract)
        expect(response).to render_template :edit
      end
    end
  end

end
