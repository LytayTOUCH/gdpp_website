class AdministratorController < ApplicationController
  before_action :authenticate_admin!
  layout 'administrator'

  def index

  end

end