class ProcurementEntitiesController < ApplicationController
  before_action :set_procurement_entity, only: [:edit, :update, :destroy]
  before_action :authenticate_admin!
  layout 'administrator'
  def index
    @procurement_entities = ProcurementEntity.all
  end
  def edit
  end
  def update
    if @procurement_entity.update_attributes(procurement_entity_param)
      flash[:notice] = "Update success!"
      redirect_to procurement_entities_path
    else
      flash[:warning] = "Update unsuccess!"
      render "edit"
    end
  end
  def new
    @procurement_entity = ProcurementEntity.new
  end
  def create
    @procurement_entity = ProcurementEntity.new(procurement_entity_param)
    if @procurement_entity.save 
      flash[:notice] = "Create success!"
      redirect_to procurement_entities_path
    else
      flash[:warning] = "Create unsuccess!"
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

  private
    def set_procurement_entity
      @procurement_entity = ProcurementEntity.find(params[:id])
    end
    def procurement_entity_param
      params.require(:procurement_entity).permit(:name)
    end


end
