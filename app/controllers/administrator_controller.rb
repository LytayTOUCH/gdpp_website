class AdministratorController < ApplicationController
  layout 'administrator'
  before_action :authenticate_admin!

  def index

  end

end