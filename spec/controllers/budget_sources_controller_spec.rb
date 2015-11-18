require 'rails_helper'
include ControllerHelpers

RSpec.describe BudgetSourcesController, type: :controller do
  login_admin

  describe "GET #BudgetSourceController" do
    context '#index' do
      it "populates an array of Budget Source" do
        @budget_sources = BudgetSource.all
        get :index
        expect(assigns(:budget_sources)).to eq @budget_sources
      end
      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end

    context "#new" do
      it "assigns a new Role to @budget_source" do
        get :new
        expect(assigns(:budget_source)).to be_a_new(BudgetSource)
      end
      it "renders the :new template" do 
        get :new
        expect(response).to render_template :new
      end
    end

    context "#edit" do
      it "assigns the requested an Budget Source to @budget_source" do
        budget_source = create(:budget_source)
        get :edit, id: budget_source
        expect(assigns(:budget_source)).to eq(budget_source)
      end
      it "renders the :edit template" do
        budget_source = create(:budget_source)
        get :edit, id: budget_source
        expect(response).to render_template :edit
      end
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new Budget Source in the database" do
        expect{ 
          post :create, budget_source: attributes_for(:budget_source)
        }.to change(BudgetSource, :count).by(1)
      end

      it "redirects to budget_sources#index" do
        post :create, budget_source: attributes_for(:budget_source)
        expect(response).to redirect_to budget_sources_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new Budget Source in the database" do
        expect{
          post :create, budget_source: attributes_for(:invalid_budget_source)
        }.to_not change(BudgetSource, :count)
      end

      it "re-renders the :new template" do
        post :create, budget_source: attributes_for(:invalid_budget_source)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      @budget_source = FactoryGirl.create(:budget_source, 
        name: "Budget Source 1")
    end

    it "locates the requested @budget_source" do
      put :update, id: @budget_source, 
      budget_source: FactoryGirl.attributes_for(:budget_source)
      expect(assigns(:budget_source)).to eq(@budget_source)
    end

    context "with valid attributes" do
      it "changes @budget_source's attributes" do
        put :update, id: @budget_source, budget_source: FactoryGirl.attributes_for(:budget_source,
            name: "Change to Budget Source 2")
        @budget_source.reload
        expect(@budget_source.name).to eq("Change to Budget Source 2")
      end
      it "redirects to the updated Budget Source" do
        put :update, id: @budget_source, 
          budget_source: FactoryGirl.attributes_for(:budget_source)
        expect(response).to redirect_to budget_sources_path
      end
    end

    context "with invalid attributes" do
      it "does not change @budget_source's attributes" do
        put :update, id: @budget_source,
          budget_source: FactoryGirl.attributes_for(:budget_source,
            name: nil)
        @budget_source.reload
        expect(@budget_source.name).to eq("Budget Source 1")
      end
      it "re-renders the edit method" do
        put :update, id: @budget_source, 
          budget_source: FactoryGirl.attributes_for(:invalid_budget_source)
        expect(response).to render_template :edit
      end
    end
  end

end
