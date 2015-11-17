require 'rails_helper'
include ControllerHelpers

RSpec.describe PublicServicesController, type: :controller do
  login_admin

  describe "GET #PublicServiceController" do
    context '#index' do
      it "populates an array of Public Service" do
        public_service_one = create(:public_service, 
        name: 'Public Service 1', position: 'Normal Staff', phone: '012 333444', email: 'abc@yahoo.com')
        public_service_two = create(:public_service, 
        name: 'Public Service 2', position: 'Specail Staff', phone: '012 444333', email: 'xyz@yahoo.com')
        get :index
        expect(assigns(:public_services)).to match_array([public_service_one, public_service_two])
      end
      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end

    context "#new" do
      it "assigns a new Role to @public_service" do
        get :new
        expect(assigns(:public_service)).to be_a_new(PublicService)
      end
      it "renders the :new template" do 
        get :new
        expect(response).to render_template :new
      end
    end

    context "#edit" do
      it "assigns the requested an Public Service to @public_service" do
        public_service = create(:public_service)
        get :edit, id: public_service
        expect(assigns(:public_service)).to eq(public_service)
      end
      it "renders the :edit template" do
        public_service = create(:public_service)
        get :edit, id: public_service
        expect(response).to render_template :edit
      end
    end
  end

  describe "POST #create" do

    context "with valid attributes" do
      it "saves the new Public Service in the database" do
        expect{ 
          post :create, public_service: attributes_for(:public_service)
        }.to change(PublicService, :count).by(1)
      end

      it "redirects to public_services#index" do
        post :create, public_service: attributes_for(:public_service)
        expect(response).to redirect_to public_services_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new Public Service in the database" do
        expect{
          post :create, public_service: attributes_for(:invalid_public_service)
        }.to_not change(PublicService, :count)
      end

      it "re-renders the :new template" do
        post :create, public_service: attributes_for(:invalid_public_service)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      @public_service = create(:public_service, 
        name: 'Public Service 1', position: 'Normal Staff', phone: '012 333444', email: 'abc@yahoo.com')
    end

    it "locates the requested @public_service" do
      put :update, id: @public_service, 
      public_service: FactoryGirl.attributes_for(:public_service)
      expect(assigns(:public_service)).to eq(@public_service)
    end

    context "with valid attributes" do
      it "changes @public_service's attributes" do
        put :update, id: @public_service, public_service: FactoryGirl.attributes_for(:public_service, 
        name: 'Change to Public Service 2', position: 'Normal Staff', phone: '012 333444', email: 'abc@yahoo.com')
        @public_service.reload
        expect(@public_service.name).to eq("Change to Public Service 2")
      end
      it "redirects to the updated Public Service" do
        put :update, id: @public_service, 
          public_service: FactoryGirl.attributes_for(:public_service)
        expect(response).to redirect_to public_services_path
      end
    end

    context "with invalid attributes" do
      it "does not change @public_service's attributes" do
        put :update, id: @public_service,
          public_service: FactoryGirl.attributes_for(:public_service, 
        name: nil, position: 'Normal Staff', phone: '012 333444', email: 'abc@yahoo.com')
        @public_service.reload
        expect(@public_service.name).to eq("Public Service 1")
      end
      it "re-renders the edit method" do
        put :update, id: @public_service, 
          public_service: FactoryGirl.attributes_for(:invalid_public_service)
        expect(response).to render_template :edit
      end
    end


  end  

end
