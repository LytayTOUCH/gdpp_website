class AdministratorController < ApplicationController
  before_action :authenticate_admin!
   before_action :set_announcement, only: [:show, :edit, :update, :destroy]
  def index

  end
  def show
  end

  def announcement
    @announcements = Announcement.all
  end

  def new_announcement
    @announcement_types = AnnouncementType.all
    @procurement_entities = ProcurementEntity.all
    @budget_sources = BudgetSource.all
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(announcement_param)
    if @announcement.save
      flash[:notice] = "Announcement successfully created"
      redirect_to announcement_administrator_index_path
    else
      flash[:notice] = "Can't create this announcment"
      redirect_to new_announcement_administrator_index_path
    end 
  end

  def edit_announcement
    @announcement_types = AnnouncementType.all
    @procurement_entities = ProcurementEntity.all
    @budget_sources = BudgetSource.all

    @announcement = Announcement.find(params[:id])
  end

  def update
    @announcement = Announcement.find(params[:id])
    if @announcement.update_attributes(announcement_param)
      flash[:notice] = "Announcement successfully updated"
      redirect_to announcement_administrator_index_path
    else
      flash[:notice] = "Can't update this announcment"
      redirect_to new_announcement_administrator_index_path
    end
  end

  def destroy
    @announcement.destroy
    flash[:notice] = "Delete Completed "
    redirect_to announcement_administrator_index_path
  end

# Budget source

  def budget_sources
    @budget_sources = BudgetSource.all
  end
  
  def edit_budget_source
    @budget_source = BudgetSource.find(params[:id])
  end

  def update_budget_source
    if BudgetSource.update(budget_source_param)
      flash[:notice] = "Budget source update completed"
      redirect_to budget_source_path
    else
      flash[:notice] = "Update not complete"
      redirect_to budget_source_path
    end
  end

private
  def set_announcement
    @announcement = Announcement.find(params[:id])
  end

  def announcement_param
    params.require(:announcement).permit(:title, :description, 
      :procurement_entity_id,:procurement_entity_id, 
      :budget_source_id, :open_register_date, :close_submit_date, 
      :open_bid_doc_date, :public)
  end

  def budget_source_param
    params.require(:budget_source).permit(:name);
  end

end