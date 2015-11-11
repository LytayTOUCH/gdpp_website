require 'rails_helper'
include ControllerHelpers
include ActionDispatch::TestProcess

RSpec.describe WebsiteController, type: :controller do
  login_admin

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #home" do
    it "populates an array in Home" do
    end
  end

  describe "GET #show_public_services" do
    it "populates an array in Public Services" do
      public_service_one = create(:public_service, name: 'Public 1', position: 'normal', phone: '012 345678', email: 'abc@yahoo.com')
      public_service_two = create(:public_service, name: 'Public 2', position: 'special', phone: '012 9999999', email: 'xyz@yahoo.com')
      get :show_public_services
      expect(assigns(:public_services)).to match_array([public_service_one, public_service_two])
    end
  end

  describe "GET #show_question_answer" do
    it "populates an array in Frequently Asked Questions" do
      faq_one = create(:faq, question: 'Question one', answer: 'Answer one')
      faq_two = create(:faq, question: 'Question two', answer: 'Answer two')
      get :show_question_answer
      expect(assigns(:faqs)).to match_array([faq_one, faq_two])
    end
  end

  describe "GET #show_procurement_entities" do
    before :each do
      @procurement_category = FactoryGirl.create(:procurement_category, 
        name: "Procurement Category")
    end
    it "populates an array in Procurement Entities" do
      procurement_entity_one = create(:procurement_entity, name: 'Procurement Entity 1', phone: '012 333333', address: 'Phnom Penh', website: 'www.abc.com', procurement_category_id: @procurement_category.id)
      procurement_entity_two = create(:procurement_entity, name: 'Procurement Entity 2', phone: '012 444444', address: 'Siem Reap', website: 'www.xyz.com', procurement_category_id: @procurement_category.id)
      get :show_procurement_entities, category_id: @procurement_category.id
      expect(assigns(:procurement_entities)).to match_array([procurement_entity_one, procurement_entity_two])
    end
  end

  describe "GET #show_gdpp_structure" do
    before :each do
      @org_structure_image = fixture_file_upload('test.pdf', 'application/pdf')
    end

    it "populates an array in GDPP structures" do
      org_structure_one = create(:org_structure, title: 'Structure one', description: 'description one')
      org_structure_two = create(:org_structure, title: 'Structure two', description: 'description two')
      get :show_gdpp_structure
      expect(assigns(:org_structures)).to match_array([org_structure_one, org_structure_two])
    end
  end

  describe "GET #show_announcements" do
    before :each do
      @announcement_type = FactoryGirl.create(:announcement_type, 
        name: "Announcement Type")
      @procurement_entity = FactoryGirl.create(:procurement_entity, 
        name: 'Procurement Entity 1', phone: '012 333333', address: 'Phnom Penh', website: 'www.abc.com', procurement_category_id: ProcurementCategory.find_or_create_by(attributes_for(:procurement_category)).id )
      @budget_source = FactoryGirl.create(:budget_source, name: "Budget Source")
    end
    # it "populates an array in Announcements" do
    #   announcement_one = FactoryGirl.create(:announcement, 
    #     title: "Announcement 1", description: "this is for first description", 
    #     announcement_type_id: @announcement_type.id, 
    #     procurement_entity_id: @procurement_entity.id, 
    #     budget_source_id: @budget_source.id, open_register_date: "2015-11-07", close_submit_date: "2015-12-31", open_bid_doc_date: "2015-11-07")
    #   announcement_two = FactoryGirl.create(:announcement, 
    #     title: "Announcement 2", description: "this is for second description", 
    #     announcement_type_id: @announcement_type.id, 
    #     procurement_entity_id: @procurement_entity.id, 
    #     budget_source_id: @budget_source.id, open_register_date: "2015-11-07", close_submit_date: "2015-12-31", open_bid_doc_date: "2015-11-07")
    #   get :show_announcements, type_id: @announcement_type.id
    #   expect(assigns(:announcements)).to match_array([announcement_one, announcement_two])
    # end
  end

  describe "GET #show_announcements" do
    it "populates an array in Announcements" do
      announcement = create(:announcement)
      get :show_announcement, id: announcement
      expect(assigns(:announcement)).to eq(announcement)
    end
  end

  describe "GET #show_procurement_plans" do
    it "populates an array in Procurement Plans" do
      procurement_plan_one = create(:procurement_plan, name: 'Procurement Plan 1', year: '2014', procurement_entity_id: ProcurementEntity.find_or_create_by(attributes_for(:procurement_entity)).id, procurement_plan_type: 'type 1')
      procurement_plan_two = create(:procurement_plan, name: 'Procurement Entity 2', year: '2015', procurement_entity_id: ProcurementEntity.find_or_create_by(attributes_for(:procurement_entity)).id, procurement_plan_type: 'type 1')
      get :show_procurement_plans, type: 'type 1'
      expect(assigns(:procurement_plans)).to match_array([procurement_plan_one, procurement_plan_two])
    end
  end

end
