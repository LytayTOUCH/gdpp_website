require 'rails_helper'
include ControllerHelpers

RSpec.describe AdministratorController, type: :controller do
  login_admin

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
