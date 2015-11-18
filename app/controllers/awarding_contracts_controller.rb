class AwardingContractsController < ApplicationController
  before_action :set_awarding_contract, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  layout 'administrator'
  def index
    @awarding_contracts = AwardingContract.all
  end

  def show
    @awarding_contract = AwardingContract.find(params[:id])
  end

  def edit
    @awarding_contract = AwardingContract.find(params[:id])
    @procurement_methods = ProcurementMethod.all
  end

  def update
    @awarding_contract = AwardingContract.find(params[:id])

    if(@awarding_contract.update_attributes(awarding_contract_params))
      flash[:notice] = "Update success"
      redirect_to awarding_contracts_path
    else
      flash[:warning] = "Update unsuccess!"
      render "edit"
    end
  end
 
  def new
    @awarding_contract = AwardingContract.new
    @procurement_methods = ProcurementMethod.all
  end

  def create
    @awarding_contract = AwardingContract.new(awarding_contract_params)
    puts awarding_contract_params
    if @awarding_contract.save
      flash[:notice] = "Create successfully"
      redirect_to awarding_contracts_path
    else
      flash[:warning] = "Create unsuccess!"
      render "new"
    end
  end

  def destroy
    @awarding_contract.destroy
    flash[:notice] = "Delete success"
    redirect_to awarding_contracts_path
  end

  private
  def set_awarding_contract
    @awarding_contract = AwardingContract.find(params[:id])
  end

  def awarding_contract_params
    params.require(:awarding_contract).permit(:title, :description, :procurement_method_id, :attachment_doc)
  end
end
