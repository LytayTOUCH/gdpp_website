class LawCategoriesController < ApplicationController
  before_action :set_law_category, only: [:edit, :update,:destroy]
  before_action :authenticate_admin!
  layout 'administrator'
  
  def index
    @law_categories = LawCategory.all
  end

  def new
    @law_category = LawCategory.new
  end

  def create
    @law_category = LawCategory.new(law_category_params)
    if @law_category.save
      flash[:notice] = "Create success!"
      redirect_to law_categories_path
    else
      flash[:warning] = "Create unsuccess!"
      render "new"
    end
  end

  def edit
    @law_category = LawCategory.find(params[:id])
  end
  
  def update
    @law_category = LawCategory.find(params[:id])

    if @law_category.update_attributes(law_category_params)
      flash[:notice] = "Update success!"
      redirect_to law_categories_path
    else
      flash[:warning] = "Update unsuccess!"
      render "edit"
    end
  end
  def destroy
    if LawRegulation.where(law_category_id: @law_category.id).empty?
      # it's related with Law Regulation
      @law_category.destroy
      flash[:notice] = "Delete success!"
    else 
      flash[:warning] = "Delete unsuccess!, or is using in Law Regulation."
    end
    redirect_to law_categories_path
  end

  private
  def set_law_category
    @law_category = LawCategory.find(params[:id])
  end
  def law_category_params
    params.require(:law_category).permit(:name)
  end
end
