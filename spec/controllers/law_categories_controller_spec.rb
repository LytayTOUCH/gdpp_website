require 'rails_helper'
include ControllerHelpers

RSpec.describe LawCategoriesController, type: :controller do
  login_admin

  describe "GET #LawCategoryController" do
    context '#index' do
      it "populates an array of Law Category" do
        @law_categories = LawCategory.all
        get :index
        expect(assigns(:law_categories)).to eq @law_categories
      end
      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end

    context "#new" do
      it "assigns a new Role to @law_category" do
        get :new
        expect(assigns(:law_category)).to be_a_new(LawCategory)
      end
      it "renders the :new template" do 
        get :new
        expect(response).to render_template :new
      end
    end

    context "#edit" do
      it "assigns the requested an Law Category to @law_category" do
        law_category = create(:law_category)
        get :edit, id: law_category
        expect(assigns(:law_category)).to eq(law_category)
      end
      it "renders the :edit template" do
        law_category = create(:law_category)
        get :edit, id: law_category
        expect(response).to render_template :edit
      end
    end
  end

  describe "POST #create" do

    context "with valid attributes" do
      it "saves the new Law Category in the database" do
        expect{ 
          post :create, law_category: attributes_for(:law_category)
        }.to change(LawCategory, :count).by(1)
      end

      it "redirects to law_categories#index" do
        post :create, law_category: attributes_for(:law_category)
        expect(response).to redirect_to law_categories_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new Law Category in the database" do
        expect{
          post :create, law_category: attributes_for(:invalid_law_category)
        }.to_not change(LawCategory, :count)
      end

      it "re-renders the :new template" do
        post :create, law_category: attributes_for(:invalid_law_category)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      @law_category = FactoryGirl.create(:law_category, 
        name: "Law Category 1")
    end

    it "locates the requested @law_category" do
      put :update, id: @law_category, 
      law_category: FactoryGirl.attributes_for(:law_category)
      expect(assigns(:law_category)).to eq(@law_category)
    end

    context "with valid attributes" do
      it "changes @law_category's attributes" do
        put :update, id: @law_category, law_category: FactoryGirl.attributes_for(:law_category,
            name: "Change to Law Category 2")
        @law_category.reload
        expect(@law_category.name).to eq("Change to Law Category 2")
      end
      it "redirects to the updated Law Category" do
        put :update, id: @law_category, 
          law_category: FactoryGirl.attributes_for(:law_category)
        expect(response).to redirect_to law_categories_path
      end
    end

    context "with invalid attributes" do
      it "does not change @law_category's attributes" do
        put :update, id: @law_category,
          law_category: FactoryGirl.attributes_for(:law_category,
            name: nil)
        @law_category.reload
        expect(@law_category.name).to eq("Law Category 1")
      end
      it "re-renders the edit method" do
        put :update, id: @law_category, 
          law_category: FactoryGirl.attributes_for(:invalid_law_category)
        expect(response).to render_template :edit
      end
    end
  end
end
