class AdministratorController < ApplicationController
  before_action :authenticate_admin!
  def index

  end
  def show
  end

  def show_announcement
    @announcments = Announcement.all
  end

end