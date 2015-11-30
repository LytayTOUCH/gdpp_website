class QuaterYearsPfmsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_quater_years_pfm, only: [:edit, :update, :destroy]
  layout 'administrator'
  def index
    @quater_years_pfms = QuaterYearsPfm.all
  end
  def new
    @quater_years_pfm = QuaterYearsPfm.new
  end
  def create
    @quater_years_pfm = QuaterYearsPfm.new(quater_years_pfm_params)
    if @quater_years_pfm.save 
      flash[:notice] = "#{@quater_years_pfm.title} Create success!"
      redirect_to quater_years_pfms_path
    else
      flash[:warning] = "Create unsuccess!"
      render "new"
    end
  end

  def edit
  end

  def update
    if @quater_years_pfm.update_attributes(quater_years_pfm_params)
      flash[:notice] = "#{@quater_years_pfm.title} Update success!"
      redirect_to quater_years_pfms_path
    else
      flash[:warning] = "Update unsuccess!"
      render "edit"
    end
  end

  def destroy
    if @quater_years_pfm.destroy
      flash[:notice] = "#{@quater_years_pfm.title} delete success"
      redirect_to quater_years_pfms_path
    else 
      flash[:warning] = "Delete unsuccess!"
      redirect_to quater_years_pfms_path
    end
  end

  def set_quater_years_pfm
    @quater_years_pfm = QuaterYearsPfm.find(params[:id])
  end
  private
    def quater_years_pfm_params
      params.require(:quater_years_pfm).permit(:title, :document)
    end
end
