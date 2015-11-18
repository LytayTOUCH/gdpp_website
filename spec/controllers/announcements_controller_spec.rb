require 'rails_helper'
include ControllerHelpers

RSpec.describe AnnouncementsController, type: :controller do
  login_admin

  describe "GET #AnnouncementController" do
    context '#index' do
      it "populates an array of Announcement" do
        @existings = Announcement.all
        get :index
        expect(assigns(:announcements)).to eq @existings
      end
      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end

    context "#new" do
      it "assigns a new Announcement to @announcement" do
        get :new
        expect(assigns(:announcement)).to be_a_new(Announcement)
      end
      it "renders the :new template" do 
        get :new
        expect(response).to render_template :new
      end
    end

    context "#edit" do
      it "assigns the requested an Announcement to @announcement" do
        announcement = create(:announcement)
        get :edit, id: announcement
        expect(assigns(:announcement)).to eq(announcement)
      end
      it "renders the :edit template" do
        announcement = create(:announcement)
        get :edit, id: announcement
        expect(response).to render_template :edit
      end
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new Announcement in the database" do
        expect{ 
          post :create, announcement: attributes_for(:announcement)
        }.to change(Announcement, :count).by(1)
      end

      it "redirects to announcements#index" do
        post :create, announcement: attributes_for(:announcement)
        expect(response).to redirect_to announcements_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new Announcement Type in the database" do
        expect{
          post :create, announcement: attributes_for(:invalid_announcement)
        }.to_not change(AnnouncementType, :count)
      end

      it "re-renders the :new template" do
        post :create, announcement: attributes_for(:invalid_announcement)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      @announcement = FactoryGirl.create(:announcement, 
        title: "Announcement 1", description: "this is for first testing", 
        announcement_type_id: AnnouncementType.find_or_create_by(attributes_for(:announcement_type)).id, 
        procurement_entity_id: ProcurementEntity.find_or_create_by(attributes_for(:procurement_entity)).id, 
        budget_source_id: BudgetSource.find_or_create_by(attributes_for(:budget_source)).id, open_register_date: "2015-11-07", close_submit_date: "2015-12-31", open_bid_doc_date: "2015-11-07")
    end

    it "locates the requested @announcement" do
      put :update, id: @announcement, 
      announcement: FactoryGirl.attributes_for(:announcement)
      expect(assigns(:announcement)).to eq(@announcement)
    end

    context "with valid attributes" do
      it "changes @announcement's attributes" do
        put :update, id: @announcement, announcement: FactoryGirl.attributes_for(:announcement, title: "Change to Announcement 2", description: "this is for second testing", 
        announcement_type_id: AnnouncementType.find_or_create_by(attributes_for(:announcement_type)).id, 
        procurement_entity_id: ProcurementEntity.find_or_create_by(attributes_for(:procurement_entity)).id, 
        budget_source_id: BudgetSource.find_or_create_by(attributes_for(:budget_source)).id, open_register_date: "2015-11-10", close_submit_date: "2016-01-01", open_bid_doc_date: "2015-11-10")
        @announcement.reload
        expect(@announcement.title).to eq("Change to Announcement 2")
      end

      it "redirects to the updated Announcement Type" do
        put :update, id: @announcement, 
          announcement: FactoryGirl.attributes_for(:announcement)
        expect(response).to redirect_to announcements_path
      end
    end

    context "with invalid attributes" do
      it "does not change @announcement's attributes" do
        put :update, id: @announcement,
          announcement: FactoryGirl.attributes_for(:announcement,
            title: nil, description: "this is for first testing", 
        announcement_type_id: AnnouncementType.find_or_create_by(attributes_for(:announcement_type)).id, 
        procurement_entity_id: ProcurementEntity.find_or_create_by(attributes_for(:procurement_entity)).id, 
        budget_source_id: BudgetSource.find_or_create_by(attributes_for(:budget_source)).id, open_register_date: "2015-11-07", close_submit_date: "2015-12-31", open_bid_doc_date: "2015-11-07")
        @announcement.reload
        expect(@announcement.title).to eq("Announcement 1")
      end
      it "re-renders the edit method" do
        put :update, id: @announcement, 
          announcement: FactoryGirl.attributes_for(:invalid_announcement)
        expect(response).to render_template :edit
      end
    end
  end

end
