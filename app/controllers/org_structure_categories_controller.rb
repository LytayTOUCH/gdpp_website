class OrgStructureCategoriesController < ApplicationController
  before_action :set_org_structure_category, only: [:edit, :update,:destroy]
  before_action :authenticate_admin!
  layout 'administrator'
  
  def index
    @org_structure_categories = OrgStructureCategory.all
  end

  def new
    @org_structure_category = OrgStructureCategory.new
  end

  def create
    @org_structure_category = OrgStructureCategory.new(org_structure_category_params)
    if @org_structure_category.save
      flash[:notice] = "Create success!"
      redirect_to org_structure_categories_path
    else
      flash[:warning] = "Create unsuccess!"
      render "new"
    end
  end

  def edit
    @org_structure_category = OrgStructureCategory.find(params[:id])
  end
  
  def update
    @org_structure_category = OrgStructureCategory.find(params[:id])

    if @org_structure_category.update_attributes(org_structure_category_params)
      flash[:notice] = "Update success!"
      redirect_to org_structure_categories_path
    else
      flash[:warning] = "Update unsuccess!"
      render "edit"
    end
  end
  def destroy
    if OrgStructure.where(org_structure_category_id: @org_structure_category.id).empty?
      # it's related with Organization Structure
      @org_structure_category.destroy
      flash[:notice] = "Delete success!"
    else 
      flash[:warning] = "Delete unsuccess!, or is using in Organization Structure."
    end
    redirect_to org_structure_categories_path
  end

  private
  def set_org_structure_category
    @org_structure_category = OrgStructureCategory.find(params[:id])
  end
  def org_structure_category_params
    params.require(:org_structure_category).permit(:name)
  end
end
