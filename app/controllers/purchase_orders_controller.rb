class PurchaseOrdersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_purchase_order, only: [:edit, :update, :destroy]
  layout 'administrator'

  def index
    @purchase_orders = PurchaseOrder.all
  end
  def new
    @procurement_categories = ProcurementCategory.all
    @procurement_methods = ProcurementMethod.all
    @purchase_order = PurchaseOrder.new
  end

  def create
    @purchase_order = PurchaseOrder.create(purchase_order_params)
    if @purchase_order.save
      flash[:notice] = t('message.success.create')
      redirect_to purchase_orders_path
    else
      flash[:warning] = t('message.unsuccess.create')
      @procurement_categories = ProcurementCategory.all
      @procurement_methods = ProcurementMethod.all
      render 'new'
    end
  end
  
  def edit
    @procurement_categories = ProcurementCategory.all
    @procurement_methods = ProcurementMethod.all
  end

  def update
    @purchase_order.update_attributes(purchase_order_params)
    if @purchase_order.save
      flash[:notice] = t('message.success.update')
      redirect_to purchase_orders_path
    else
      flash[:warning] = t('message.usuccess.update')
      @procurement_categories = ProcurementCategory.all
      @procurement_methods = ProcurementMethod.all
      render 'edit'
    end
  end

  def destroy
    if @purchase_order.destroy
      flash[:notice] = t('message.success.delete')
      redirect_to purchase_orders_path
    else
      flash[:warning] = t('message.unsuccess.delete')
      redirect_to purchase_orders_path
    end
  end

  def set_purchase_order
    @purchase_order  = PurchaseOrder.find(params[:id])
  end

  private
    def purchase_order_params
      params.require(:purchase_order).permit(:project_name, :procurement_method_id, :procurement_category_id,:purchase_order_date, :document)
    end
end
