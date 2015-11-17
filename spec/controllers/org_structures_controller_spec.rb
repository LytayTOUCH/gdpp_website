require 'rails_helper'
include ControllerHelpers

RSpec.describe OrgStructuresController, type: :controller do
  login_admin

  describe "GET #OrgStructureController" do
    context '#index' do
      it "populates an array of Org Structure" do
        org_structure_one = create(:org_structure, title: 'Org Structure 1', description: 'description 1')
        org_structure_two = create(:org_structure, title: 'Org Structure 2', description: 'description 2')
        get :index
        expect(assigns(:org_structures)).to match_array([org_structure_one, org_structure_two])
      end
      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end

    context "#new" do
      it "assigns a new Role to @org_structure" do
        get :new
        expect(assigns(:org_structure)).to be_a_new(OrgStructure)
      end
      it "renders the :new template" do 
        get :new
        expect(response).to render_template :new
      end
    end

    context "#edit" do
      it "assigns the requested an Org Structure to @org_structure" do
        org_structure = create(:org_structure)
        get :edit, id: org_structure
        expect(assigns(:org_structure)).to eq(org_structure)
      end
      it "renders the :edit template" do
        org_structure = create(:org_structure)
        get :edit, id: org_structure
        expect(response).to render_template :edit
      end
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new Org Structure in the database" do
        expect{ 
          post :create, org_structure: attributes_for(:org_structure)
        }.to change(OrgStructure, :count).by(1)
      end

      it "redirects to org_structures#index" do
        post :create, org_structure: attributes_for(:org_structure)
        expect(response).to redirect_to org_structures_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new Org Structure in the database" do
        expect{
          post :create, org_structure: attributes_for(:invalid_org_structure)
        }.to_not change(OrgStructure, :count)
      end

      it "re-renders the :new template" do
        post :create, org_structure: attributes_for(:invalid_org_structure)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      @org_structure = FactoryGirl.create(:org_structure, 
        title: "Org Structure 1", description: "description 1")
    end

    it "locates the requested @org_structure" do
      put :update, id: @org_structure, 
      org_structure: FactoryGirl.attributes_for(:org_structure)
      expect(assigns(:org_structure)).to eq(@org_structure)
    end

    context "with valid attributes" do
      it "changes @org_structure's attributes" do
        put :update, id: @org_structure, org_structure: FactoryGirl.attributes_for(:org_structure,
            title: "Change to Org Structure 2", description: "description 1")
        @org_structure.reload
        expect(@org_structure.title).to eq("Change to Org Structure 2")
      end
      it "redirects to the updated Org Structure" do
        put :update, id: @org_structure, 
          org_structure: FactoryGirl.attributes_for(:org_structure)
        expect(response).to redirect_to org_structures_path
      end
    end

    context "with invalid attributes" do
      it "does not change @org_structure's attributes" do
        put :update, id: @org_structure,
          org_structure: FactoryGirl.attributes_for(:org_structure,
            title: nil, description: "description 1")
        @org_structure.reload
        expect(@org_structure.title).to eq("Org Structure 1")
      end
      it "re-renders the edit method" do
        put :update, id: @org_structure, 
          org_structure: FactoryGirl.attributes_for(:invalid_org_structure)
        expect(response).to render_template :edit
      end
    end
  end

end
