class PublicServicesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_public_service, only: [:edit, :update, :destroy]
  layout 'administrator'
  def index
    @public_services = PublicService.all
  end

  def new
    @public_service = PublicService.new
  end

  def create
    @public_service = PublicService.new(public_service_param)
    if @public_service.save 
      flash[:notice] = "#{@public_service.name} Create success!"
      redirect_to public_services_path
    else
      flash[:warning] = "Create unsuccess!"
      render "new"
    end
  end

  def edit
  end
  
  def update
    if @public_service.update_attributes(public_service_param)
      flash[:notice] = "#{@public_service.name} Update success!"
      redirect_to public_services_path
    else
      flash[:warning] = "Update unsuccess!"
      render "edit"
    end
  end

  def destroy
    if @public_service.destroy
      flash[:notice] = "#{@public_service.name} delete success"
      redirect_to public_services_path
    else 
      flash[:warning] = "Delete unsuccess!"
      redirect_to public_services_path
    end
  end

  private
    def set_public_service
      @public_service = PublicService.find(params[:id])
    end
    def public_service_param
      params.require(:public_service).permit(:name, :position, :phone, :email)
    end
end
