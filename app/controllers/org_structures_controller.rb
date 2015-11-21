class OrgStructuresController < ApplicationController
  before_action :set_org_structure, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  layout 'administrator'

  def index
    @org_structures = OrgStructure.all
  end

  def show
    @org_structure = OrgStructure.find(params[:id])
  end

  def new
    @org_structure = OrgStructure.new
    @org_structure_categories = OrgStructureCategory.all
  end

  def create
    @org_structure = OrgStructure.new(org_structure_params)
    
    if @org_structure.save
      puts @org_structure
      flash[:notice] = "Organizational Structure has been created successfully"
      redirect_to org_structures_path
    else
      flash[:warning] = "Organizational Structure cannot be created"
      render 'new'
    end
  end

  def edit
    @org_structure = OrgStructure.find(params[:id])
    @org_structure_categories = OrgStructureCategory.all
  end

  def update
    @org_structure = OrgStructure.find(params[:id])

    if(@org_structure.update_attributes(org_structure_params))
      flash[:notice] = "Organizational Structure has been updated successfully"
      redirect_to org_structures_path
    else
      flash[:warning] = "Updated not success!"
      render "edit"
    end
  end

  def destroy
    @org_structure.destroy
    flash[:notice] = "Delete success"
    redirect_to org_structures_path
  end

  private
  def set_org_structure
    @org_structure = OrgStructure.find(params[:id])
  end

  def org_structure_params
    params.require(:org_structure).permit(:title, :description, :org_structure_image, :org_structure_category_id)
  end
end
