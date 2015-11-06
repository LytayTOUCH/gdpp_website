require 'rails_helper'
include ControllerHelpers

RSpec.describe AnnouncementTypesController, type: :controller do
  before { @admin = create(:admin) }

  describe "GET #AnnouncementTypeController" do
    login_admin

    context '#index' do
      it "populates an array of Announcement Type" do
        @existings = AnnouncementType.all
        get :index
        expect(assigns(:announcement_types)).to eq @existings
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

end
