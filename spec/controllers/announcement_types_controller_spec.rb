require 'rails_helper'
include ControllerHelpers

RSpec.describe AnnouncementTypesController, type: :controller do
  login_admin

  describe "GET #AnnouncementTypeController" do
    context '#index' do
      it "populates an array of Announcement Type" do
        @announcement_types = AnnouncementType.all
        get :index
        expect(assigns(:announcement_types)).to eq @announcement_types
      end
      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end

    context "#new" do
      it "assigns a new Role to @announcement_type" do
        get :new
        expect(assigns(:announcement_type)).to be_a_new(AnnouncementType)
      end
      it "renders the :new template" do 
        get :new
        expect(response).to render_template :new
      end
    end

    context "#edit" do
      it "assigns the requested an Announcement Type to @announcement_type" do
        announcement_type = create(:announcement_type)
        get :edit, id: announcement_type
        expect(assigns(:announcement_type)).to eq(announcement_type)
      end
      it "renders the :edit template" do
        announcement_type = create(:announcement_type)
        get :edit, id: announcement_type
        expect(response).to render_template :edit
      end
    end
  end

  describe "POST #create" do

    context "with valid attributes" do
      it "saves the new Announcement Type in the database" do
        expect{ 
          post :create, announcement_type: attributes_for(:announcement_type)
        }.to change(AnnouncementType, :count).by(1)
      end

      it "redirects to announcement_types#index" do
        post :create, announcement_type: attributes_for(:announcement_type)
        expect(response).to redirect_to announcement_types_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new Announcement Type in the database" do
        expect{
          post :create, announcement_type: attributes_for(:invalid_announcement_type)
        }.to_not change(AnnouncementType, :count)
      end

      it "re-renders the :new template" do
        post :create, announcement_type: attributes_for(:invalid_announcement_type)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      @announcement_type = FactoryGirl.create(:announcement_type, 
        name: "Announcement Type 1")
    end

    it "locates the requested @announcement_type" do
      put :update, id: @announcement_type, 
      announcement_type: FactoryGirl.attributes_for(:announcement_type)
      expect(assigns(:announcement_type)).to eq(@announcement_type)
    end

    context "with valid attributes" do
      it "changes @announcement_type's attributes" do
        put :update, id: @announcement_type, announcement_type: FactoryGirl.attributes_for(:announcement_type,
            name: "Change to Announcement Type 2")
        @announcement_type.reload
        expect(@announcement_type.name).to eq("Change to Announcement Type 2")
      end
      it "redirects to the updated Announcement Type" do
        put :update, id: @announcement_type, 
          announcement_type: FactoryGirl.attributes_for(:announcement_type)
        expect(response).to redirect_to announcement_types_path
      end
    end

    context "with invalid attributes" do
      it "does not change @announcement_type's attributes" do
        put :update, id: @announcement_type,
          announcement_type: FactoryGirl.attributes_for(:announcement_type,
            name: nil)
        @announcement_type.reload
        expect(@announcement_type.name).to eq("Announcement Type 1")
      end
      it "re-renders the edit method" do
        put :update, id: @announcement_type, 
          announcement_type: FactoryGirl.attributes_for(:invalid_announcement_type)
        expect(response).to render_template :edit
      end
    end
  end

end
