require 'rails_helper'
include ControllerHelpers

RSpec.describe ProcurementEntitiesController, type: :controller do
  login_admin

  describe "GET #ProcurementEntityController" do
    context '#index' do
      it "populates an array of Procurement Entities" do
        procurement_entity_one = create(:procurement_entity, 
        name: 'Procurement Entity 1', phone: '012 333333', address: 'Phnom Penh', website: 'www.abc.com', procurement_category_id: ProcurementCategory.find_or_create_by(attributes_for(:procurement_category)).id)
        procurement_entity_two = create(:procurement_entity, 
        name: 'Procurement Entity 2', phone: '012 444444', address: 'Siem Reap', website: 'www.xyz.com', procurement_category_id: ProcurementCategory.find_or_create_by(attributes_for(:procurement_category)).id)
        get :index
        expect(assigns(:procurement_entities)).to match_array([procurement_entity_one, procurement_entity_two])
      end
      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end

    context "#new" do
      it "assigns a new ProcurementEntity to @procurement_entity" do
        get :new
        expect(assigns(:procurement_entity)).to be_a_new(ProcurementEntity)
      end
      it "renders the :new template" do 
        get :new
        expect(response).to render_template :new
      end
    end

    context "#edit" do
      it "assigns the requested an ProcurementEntity to @procurement_entity" do
        procurement_entity = create(:procurement_entity)
        get :edit, id: procurement_entity
        expect(assigns(:procurement_entity)).to eq(procurement_entity)
      end
      it "renders the :edit template" do
        procurement_entity = create(:procurement_entity)
        get :edit, id: procurement_entity
        expect(response).to render_template :edit
      end
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new Procurement Entity in the database" do
        expect{ 
          post :create, procurement_entity: attributes_for(:procurement_entity)
        }.to change(ProcurementEntity, :count).by(1)
      end

      it "redirects to procurement_entities#index" do
        post :create, procurement_entity: attributes_for(:procurement_entity)
        expect(response).to redirect_to procurement_entities_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new Procurement Entity in the database" do
        expect{
          post :create, procurement_entity: attributes_for(:invalid_procurement_entity)
        }.to_not change(ProcurementEntity, :count)
      end

      it "re-renders the :new template" do
        post :create, procurement_entity: attributes_for(:invalid_procurement_entity)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      @procurement_entity = FactoryGirl.create(:procurement_entity, 
        name: 'Procurement Entity 1', phone: '012 333333', address: 'Phnom Penh', website: 'www.abc.com', procurement_category_id: ProcurementCategory.find_or_create_by(attributes_for(:procurement_category)).id)
    end

    it "locates the requested @procurement_entity" do
      put :update, id: @procurement_entity, 
      procurement_entity: FactoryGirl.attributes_for(:procurement_entity)
      expect(assigns(:procurement_entity)).to eq(@procurement_entity)
    end

    context "with valid attributes" do
      it "changes @procurement_entity's attributes" do
        put :update, id: @procurement_entity, 
        procurement_entity: FactoryGirl.attributes_for(:procurement_entity, 
        name: 'Change to Procurement Entity 2', phone: '012 555555', address: 'Phnom Penh', website: 'www.xyz.com', procurement_category_id: ProcurementCategory.find_or_create_by(attributes_for(:procurement_category)).id)
        @procurement_entity.reload
        expect(@procurement_entity.name).to eq("Change to Procurement Entity 2")
      end

      it "redirects to the updated Procurement Entity Type" do
        put :update, id: @procurement_entity, 
          procurement_entity: FactoryGirl.attributes_for(:procurement_entity)
        expect(response).to redirect_to procurement_entities_path
      end
    end

    context "with invalid attributes" do
      it "does not change @procurement_entity's attributes" do
        put :update, id: @procurement_entity,
          procurement_entity: FactoryGirl.attributes_for(:procurement_entity, 
        name: 'Procurement Entity 1', phone: '012 555555', address: 'Phnom Penh', website: 'www.xyz.com', procurement_category_id: ProcurementCategory.find_or_create_by(attributes_for(:procurement_category)).id)
        @procurement_entity.reload
        expect(@procurement_entity.name).to eq("Procurement Entity 1")
      end
      it "re-renders the edit method" do
        put :update, id: @procurement_entity, 
          procurement_entity: FactoryGirl.attributes_for(:invalid_procurement_entity)
        expect(response).to render_template :edit
      end
    end
  end

end
