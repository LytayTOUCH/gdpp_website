require 'rails_helper'
include ControllerHelpers

RSpec.describe ProcurementPlansController, type: :controller do
  login_admin

  describe "GET #ProcurementPlanController" do
    context '#index' do
      it "populates an array of Procurement Plans" do
        procurement_plan_one = create(:procurement_plan, 
        name: 'Procurement Entity 1', year: '2014', procurement_plan_type: 'type 1', procurement_entity_id: ProcurementEntity.find_or_create_by(attributes_for(:procurement_entity)).id)
        procurement_plan_two = create(:procurement_plan, 
        name: 'Procurement Entity 2', year: '2015', procurement_plan_type: 'type 2', procurement_entity_id: ProcurementEntity.find_or_create_by(attributes_for(:procurement_entity)).id)
        get :index
        expect(assigns(:procurement_plans)).to match_array([procurement_plan_one, procurement_plan_two])
      end
      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end

    context "#new" do
      it "assigns a new ProcurementPlan to @procurement_plan" do
        get :new
        expect(assigns(:procurement_plan)).to be_a_new(ProcurementPlan)
      end
      it "renders the :new template" do 
        get :new
        expect(response).to render_template :new
      end
    end

    context "#edit" do
      it "assigns the requested an ProcurementPlan to @procurement_plan" do
        procurement_plan = create(:procurement_plan)
        get :edit, id: procurement_plan
        expect(assigns(:procurement_plan)).to eq(procurement_plan)
      end
      it "renders the :edit template" do
        procurement_plan = create(:procurement_plan)
        get :edit, id: procurement_plan
        expect(response).to render_template :edit
      end
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new Procurement Plan in the database" do
        expect{ 
          post :create, procurement_plan: attributes_for(:procurement_plan)
        }.to change(ProcurementPlan, :count).by(1)
      end

      it "redirects to procurement_plans#index" do
        post :create, procurement_plan: attributes_for(:procurement_plan)
        expect(response).to redirect_to procurement_plans_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new Procurement Plan in the database" do
        expect{
          post :create, procurement_plan: attributes_for(:invalid_procurement_plan)
        }.to_not change(ProcurementPlan, :count)
      end

      it "re-renders the :new template" do
        post :create, procurement_plan: attributes_for(:invalid_procurement_plan)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      @procurement_plan = FactoryGirl.create(:procurement_plan, 
        name: 'Procurement Entity 1', year: '2014', procurement_plan_type: 'type 1', procurement_entity_id: ProcurementEntity.find_or_create_by(attributes_for(:procurement_entity)).id)
    end

    it "locates the requested @procurement_plan" do
      put :update, id: @procurement_plan, 
      procurement_plan: FactoryGirl.attributes_for(:procurement_plan)
      expect(assigns(:procurement_plan)).to eq(@procurement_plan)
    end

    context "with valid attributes" do
      it "changes @procurement_plan's attributes" do
        put :update, id: @procurement_plan, 
        procurement_plan: FactoryGirl.attributes_for(:procurement_plan, 
        name: 'Change to Procurement Entity 2', year: '2014', procurement_plan_type: 'type 1', procurement_entity_id: ProcurementEntity.find_or_create_by(attributes_for(:procurement_entity)).id)
        @procurement_plan.reload
        expect(@procurement_plan.name).to eq("Change to Procurement Entity 2")
      end

      it "redirects to the updated Procurement Entity Type" do
        put :update, id: @procurement_plan, 
          procurement_plan: FactoryGirl.attributes_for(:procurement_plan)
        expect(response).to redirect_to procurement_plans_path
      end
    end

    context "with invalid attributes" do
      it "does not change @procurement_plan's attributes" do
        put :update, id: @procurement_plan,
          procurement_plan: FactoryGirl.attributes_for(:procurement_plan, 
        name: 'Procurement Entity 1', year: '2014', procurement_plan_type: 'type 1', procurement_entity_id: ProcurementEntity.find_or_create_by(attributes_for(:procurement_entity)).id)
        @procurement_plan.reload
        expect(@procurement_plan.name).to eq("Procurement Entity 1")
      end
      it "re-renders the edit method" do
        put :update, id: @procurement_plan, 
          procurement_plan: FactoryGirl.attributes_for(:invalid_procurement_plan)
        expect(response).to render_template :edit
      end
    end

  end

end
