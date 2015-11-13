require 'rails_helper'
include ControllerHelpers

RSpec.describe ProcurementMethodsController, type: :controller do
  login_admin

  describe "GET #ProcurementMethodController" do
    context '#index' do
      it "populates an array of Procurement Method" do
        procurement_method_one = create(:procurement_method, name: 'Procurement Method 1')
        procurement_method_two = create(:procurement_method, name: 'Procurement Method 2')
        get :index
        expect(assigns(:procurement_methods)).to match_array([procurement_method_one, procurement_method_two])
      end
      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end

    context "#new" do
      it "assigns a new Role to @procurement_method" do
        get :new
        expect(assigns(:procurement_method)).to be_a_new(ProcurementMethod)
      end
      it "renders the :new template" do 
        get :new
        expect(response).to render_template :new
      end
    end

    context "#edit" do
      it "assigns the requested an Procurement Method to @procurement_method" do
        procurement_method = create(:procurement_method)
        get :edit, id: procurement_method
        expect(assigns(:procurement_method)).to eq(procurement_method)
      end
      it "renders the :edit template" do
        procurement_method = create(:procurement_method)
        get :edit, id: procurement_method
        expect(response).to render_template :edit
      end
    end
  end

  describe "POST #create" do

    context "with valid attributes" do
      it "saves the new Procurement Method in the database" do
        expect{ 
          post :create, procurement_method: attributes_for(:procurement_method)
        }.to change(ProcurementMethod, :count).by(1)
      end

      it "redirects to procurement_methods#index" do
        post :create, procurement_method: attributes_for(:procurement_method)
        expect(response).to redirect_to procurement_methods_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new Procurement Method in the database" do
        expect{
          post :create, procurement_method: attributes_for(:invalid_procurement_method)
        }.to_not change(ProcurementMethod, :count)
      end

      it "re-renders the :new template" do
        post :create, procurement_method: attributes_for(:invalid_procurement_method)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      @procurement_method = FactoryGirl.create(:procurement_method, 
        name: "Procurement Method 1")
    end

    it "locates the requested @procurement_method" do
      put :update, id: @procurement_method, 
      procurement_method: FactoryGirl.attributes_for(:procurement_method)
      expect(assigns(:procurement_method)).to eq(@procurement_method)
    end

    context "with valid attributes" do
      it "changes @procurement_method's attributes" do
        put :update, id: @procurement_method, procurement_method: FactoryGirl.attributes_for(:procurement_method,
            name: "Change to Procurement Method 2")
        @procurement_method.reload
        expect(@procurement_method.name).to eq("Change to Procurement Method 2")
      end
      it "redirects to the updated Procurement Method" do
        put :update, id: @procurement_method, 
          procurement_method: FactoryGirl.attributes_for(:procurement_method)
        expect(response).to redirect_to procurement_methods_path
      end
    end

    context "with invalid attributes" do
      it "does not change @procurement_method's attributes" do
        put :update, id: @procurement_method,
          procurement_method: FactoryGirl.attributes_for(:procurement_method,
            name: nil)
        @procurement_method.reload
        expect(@procurement_method.name).to eq("Procurement Method 1")
      end
      it "re-renders the edit method" do
        put :update, id: @procurement_method, 
          procurement_method: FactoryGirl.attributes_for(:invalid_procurement_method)
        expect(response).to render_template :edit
      end
    end
  end

end
