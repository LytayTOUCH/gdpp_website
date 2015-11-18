class ProcurementMethodsController < ApplicationController
  before_action :set_procurement_method, only: [:edit, :update,:destroy]
  before_action :authenticate_admin!
  layout 'administrator'
  
  def index
    @procurement_methods = ProcurementMethod.all
  end

  def new
    @procurement_method = ProcurementMethod.new
  end

  def create
    @procurement_method = ProcurementMethod.new(procurement_method_param)
    if @procurement_method.save
      flash[:notice] = "Create success!"
      redirect_to procurement_methods_path
    else
      flash[:warning] = "Create unsuccess!"
      render "new"
    end
  end

  def edit
    @procurement_method = ProcurementMethod.find(params[:id])
  end
  
  def update
    @procurement_method = ProcurementMethod.find(params[:id])

    if @procurement_method.update_attributes(procurement_method_param)
      flash[:notice] = "Update success!"
      redirect_to procurement_methods_path
    else
      flash[:warning] = "Update unsuccess!"
      render "edit"
    end
  end
  def destroy
    if AwardingContract.where(procurement_method_id: @procurement_method.id).empty?
      # it's related with AwardingContract
      @procurement_method.destroy
      flash[:notice] = "Delete success!"
    else 
      flash[:warning] = "Delete unsuccess!, or is using in Awarding Contract."
    end
    redirect_to procurement_methods_path
  end

  private
    def set_procurement_method
      @procurement_method = ProcurementMethod.find(params[:id])
    end
    def procurement_method_param
      params.require(:procurement_method).permit(:name)
    end
end
