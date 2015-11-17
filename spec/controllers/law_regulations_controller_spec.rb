require 'rails_helper'
include ControllerHelpers

RSpec.describe LawRegulationsController, type: :controller do
  login_admin

  describe "GET #LawRegulationController" do
    context '#index' do
      it "populates an array of LawRegulation" do
        law_regulation_one = create(:law_regulation, title: 'Law Regulation 1', description: 'description 1', law_category_id: LawCategory.find_or_create_by(attributes_for(:law_category)).id)
        law_regulation_two = create(:law_regulation, title: 'Law Regulation 2', description: 'description 2', law_category_id: LawCategory.find_or_create_by(attributes_for(:law_category)).id)
        get :index
        expect(assigns(:law_regulations)).to match_array([law_regulation_one, law_regulation_two])
      end
      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end

    context "#new" do
      it "assigns a new Law Regulation to @law_regulation" do
        get :new
        expect(assigns(:law_regulation)).to be_a_new(LawRegulation)
      end
      it "renders the :new template" do 
        get :new
        expect(response).to render_template :new
      end
    end

    context "#edit" do
      it "assigns the requested an Law Regulation to @law_regulation" do
        law_regulation = create(:law_regulation)
        get :edit, id: law_regulation
        expect(assigns(:law_regulation)).to eq(law_regulation)
      end
      it "renders the :edit template" do
        law_regulation = create(:law_regulation)
        get :edit, id: law_regulation
        expect(response).to render_template :edit
      end
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new Law Regulation in the database" do
        expect{ 
          post :create, law_regulation: attributes_for(:law_regulation)
        }.to change(LawRegulation, :count).by(1)
      end

      it "redirects to law_regulations#index" do
        post :create, law_regulation: attributes_for(:law_regulation)
        expect(response).to redirect_to law_regulations_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new Law Regulation in the database" do
        expect{
          post :create, law_regulation: attributes_for(:invalid_law_regulation)
        }.to_not change(LawRegulation, :count)
      end

      it "re-renders the :new template" do
        post :create, law_regulation: attributes_for(:invalid_law_regulation)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      @law_regulation = FactoryGirl.create(:law_regulation, 
        title: "Law Regulation 1", description: "description 1", law_category_id: LawCategory.find_or_create_by(attributes_for(:law_category)).id)
    end

    it "locates the requested @law_regulation" do
      put :update, id: @law_regulation, 
      law_regulation: FactoryGirl.attributes_for(:law_regulation)
      expect(assigns(:law_regulation)).to eq(@law_regulation)
    end

    context "with valid attributes" do
      it "changes @law_regulation's attributes" do
        put :update, id: @law_regulation, law_regulation: FactoryGirl.attributes_for(:law_regulation,
            title: "Change to Law Regulation 2", description: "description 1", law_category_id: LawCategory.find_or_create_by(attributes_for(:law_category)).id)
        @law_regulation.reload
        expect(@law_regulation.title).to eq("Change to Law Regulation 2")
      end
      it "redirects to the updated Law Regulation" do
        put :update, id: @law_regulation, 
          law_regulation: FactoryGirl.attributes_for(:law_regulation)
        expect(response).to redirect_to law_regulations_path
      end
    end

    context "with invalid attributes" do
      it "does not change @law_regulation's attributes" do
        put :update, id: @law_regulation,
          law_regulation: FactoryGirl.attributes_for(:law_regulation,
            title: nil, description: "description 1", law_category_id: LawCategory.find_or_create_by(attributes_for(:law_category)).id)
        @law_regulation.reload
        expect(@law_regulation.title).to eq("Law Regulation 1")
      end
      it "re-renders the edit method" do
        put :update, id: @law_regulation, 
          law_regulation: FactoryGirl.attributes_for(:invalid_law_regulation)
        expect(response).to render_template :edit
      end
    end
  end

end
