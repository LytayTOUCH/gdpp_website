class AnnouncementTypesController < ApplicationController
  before_action :set_announcement_type, only: [:edit, :update,:destroy]
  before_action :authenticate_admin!
  layout 'administrator'
  
  def index
    @announcement_types = AnnouncementType.all
  end

  def new
    @announcement_type = AnnouncementType.new
  end

  def create
    @announcement_type = AnnouncementType.new(announcement_type_param)
    if @announcement_type.save
      flash[:notice] = "Create success!"
      redirect_to announcement_types_path
    else
      flash[:warning] = "Create unsuccess!"
      render "new"
    end
  end

  def edit
    
  end
  def update
    if @announcement_type.update_attributes(announcement_type_param)
      flash[:notice] = "Update success!"
      redirect_to announcement_types_path
    else
      flash[:warning] = "Update unsuccess!"
      render "edit"
    end
  end
  def destroy
    if Announcement.where(announcement_type_id: @announcement_type.id).empty?
      # it's related with announcement
      @announcement_type.destroy
      flash[:notice] = "Delete success!"
    else 
      flash[:warning] = "Delete unsuccess!, or is using in Announcement."
    end
    redirect_to announcement_types_path
  end

  private
    def set_announcement_type
      @announcement_type = AnnouncementType.find(params[:id])
    end
    def announcement_type_param
      params.require(:announcement_type).permit(:name)
    end

end
