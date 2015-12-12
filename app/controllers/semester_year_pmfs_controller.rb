class SemesterYearPmfsController < ApplicationController
  before_action :set_semester_year_pmf, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  layout 'administrator'

  def index
    @semester_year_pmfs = SemesterYearPmf.all
  end

  def show
    @semester_year_pmf = SemesterYearPmf.find(params[:id])
  end

  def new
    @semester_year_pmf = SemesterYearPmf.new
  end

  def create
    @semester_year_pmf = SemesterYearPmf.new(semester_year_pmf_params)
    
    if @semester_year_pmf.save
      puts @semester_year_pmf
      flash[:notice] = "Organizational Structure has been created successfully"
      redirect_to semester_year_pmfs_path
    else
      flash[:warning] = "Organizational Structure cannot be created"
      render 'new'
    end
  end

  def edit
    @semester_year_pmf = SemesterYearPmf.find(params[:id])
  end

  def update
    @semester_year_pmf = SemesterYearPmf.find(params[:id])

    if(@semester_year_pmf.update_attributes(semester_year_pmf_params))
      flash[:notice] = "Organizational Structure has been updated successfully"
      redirect_to semester_year_pmfs_path
    else
      flash[:warning] = "Updated not success!"
      render "edit"
    end
  end

  def destroy
    @semester_year_pmf.destroy
    flash[:notice] = "Delete success"
    redirect_to semester_year_pmfs_path
  end

  private
  def set_semester_year_pmf
    @semester_year_pmf = SemesterYearPmf.find(params[:id])
  end

  def semester_year_pmf_params
    params.require(:semester_year_pmf).permit(:title, :year, :file_attachment)
  end
end
