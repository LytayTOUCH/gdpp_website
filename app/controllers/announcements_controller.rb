class AnnouncementsController < ApplicationController
  before_action :authenticate_admin!, :set_announcement, only: [:show, :edit, :update, :destroy]
  layout 'administrator'
  def index
    @announcements = Announcement.all
  end
  def edit
    @announcement_types = AnnouncementType.all
    @procurement_entities = ProcurementEntity.all
    @budget_sources = BudgetSource.all
  end
  def update
    if(@announcement.update_attributes(announcement_param))
      flash[:notice] = "Update success"
      redirect_to announcement_path
    else
      flash[:notice] = "Update faild"
      render "edit"
    end
  end
 
  def new
    @announcement_types = AnnouncementType.all
    @procurement_entities = ProcurementEntity.all
    @budget_sources = BudgetSource.all
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(announcement_param)
    if @announcement.save
      flash[:notice] = "Create successfully"
      redirect_to announcements_path
    else
      flash[:notice] = "Create Unsuccess!"
      render "new"
    end
  end

  def destroy
    
  end

  private
    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    def announcement_param
      params.require(:announcement).permit(
        :title,
        :description,
        :announcement_type_id,
        :procurement_entity_id,
        :budget_source_id,
        :open_register_date,
        :close_submit_date,
        :open_bid_doc_date,
        :public
        )
    end

end
