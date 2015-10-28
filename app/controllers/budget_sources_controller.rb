class BudgetSourcesController < ApplicationController
  before_action :set_budget_source, only:[:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  layout 'administrator'
  def index
    @budget_sources = BudgetSource.all
  end

  def edit
    
  end

  def new
    @budget_source = BudgetSource.new
  end
  
  def create
    @budget_source = BudgetSource.new(budget_source_param)
    if @budget_source.save 
      flash[:notice] = "Create successfully"
      redirect_to budget_sources_path
    else
      flash[:notice] = "Create unsuccess"
      render "new"
    end
  end

  def update
    if @budget_source.update_attributes(budget_source_param)
      flash[:notice] = "Update success"
      redirect_to budget_sources_path
    else
      flash[:notice] = "unable to update"
      render "edit"
    end
  end

  def destroy
    if Announcement.where(budget_source_id: @budget_source.id).empty?
      # it's related with announcement
      @budget_source.destroy
      flash[:notice] = "Delete success"
      redirect_to budget_sources_path
    else 
      flash[:notice] = "Can't not delete, this using in announcment"
      redirect_to budget_sources_path
    end

    # @budget_source.destroy
    # flash[:notice] = "Delete success"
    # redirect_to budget_sources_path
  end


  private
    def set_budget_source
      @budget_source = BudgetSource.find(params[:id])
    end

    def budget_source_param
      params.require(:budget_source).permit(:name)
    end

end
