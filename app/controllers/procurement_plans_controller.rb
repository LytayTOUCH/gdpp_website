class ProcurementPlansController < ApplicationController
  before_action :set_procurement_plan, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  layout 'administrator'

  def index
    @procurement_plans = ProcurementPlan.all
  end

  def show
  end

  def new
    @procurement_entities = ProcurementEntity.all
    @procurement_plan = ProcurementPlan.new
  end

  def create
    @procurement_plan = ProcurementPlan.new(procurement_plan_param)
    if @procurement_plan.save
      flash[:notice] = "Create success!"
      redirect_to procurement_plans_path
    else
      flash[:warning] = "Create unsuccess!"
      @procurement_entities = ProcurementEntity.all
      render "new"
    end
  end

  def edit
    @procurement_entities = ProcurementEntity.all
  end

  def update
    if @procurement_plan.update_attributes(procurement_plan_param)
      flash[:notice] = "Update success!"
      redirect_to procurement_plans_path
    else
      flash[:warning] = "Update unsuccess!"
      @procurement_entities = ProcurementEntity.all
      render "edit"
    end
  end

  def destroy
    if @procurement_plan.destroy
      flash[:notice] = "#{@procurement_plan.name} delete success"
      redirect_to procurement_plans_path
    else 
      flash[:warning] = "Delete unsuccess!"
      redirect_to procurement_plans_path
    end
  end

  private
    def set_procurement_plan
      @procurement_plan = ProcurementPlan.find(params[:id])
    end
    def procurement_plan_param
      params.require(:procurement_plan).permit(:name, :procurement_entity_id, :year, :procurement_plan_type, :procurement_plan_file)
    end

end
