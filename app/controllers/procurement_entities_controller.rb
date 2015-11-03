class ProcurementEntitiesController < ApplicationController
  before_action :set_procurement_entity, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  layout 'administrator'
  def index
    @procurement_entities = ProcurementEntity.all.sort_by_last_update
  end
  def edit
    @procurement_categories = ProcurementCategory.all
  end
  def update
    if @procurement_entity.update_attributes(procurement_entity_param)
      flash[:notice] = "Update success!"
      redirect_to procurement_entities_path
    else
      flash[:warning] = "Update unsuccess!"
      @procurement_categories = ProcurementCategory.all
      render "edit"
    end
  end
  def new
    @procurement_categories = ProcurementCategory.all
    @procurement_entity = ProcurementEntity.new
  end
  def create
    @procurement_entity = ProcurementEntity.new(procurement_entity_param)
    if @procurement_entity.save 
      flash[:notice] = "Create success!"
      redirect_to procurement_entities_path
    else
      flash[:warning] = "Create unsuccess!"
      @procurement_categories = ProcurementCategory.all
      render "new"
    end
  end
  def destroy
    if Announcement.where(procurement_entity_id: @procurement_entity.id).empty?
      # it's related with announcement
      @procurement_entity.destroy
      flash[:notice] = "Delete success"
      redirect_to procurement_entities_path
    else 
      flash[:warning] = "Delete unsuccess, or is using in Announcment."
      redirect_to procurement_entities_path
    end
  end

  def show
  end

  private
    def set_procurement_entity
      @procurement_entity = ProcurementEntity.find(params[:id])
    end
    def procurement_entity_param
      params.require(:procurement_entity).permit(:name, :procurement_category_id, :phone, :address, :website, :logo)
    end


end
