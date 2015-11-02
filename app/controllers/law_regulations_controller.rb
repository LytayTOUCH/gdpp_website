class LawRegulationsController < ApplicationController
  layout 'administrator'
  before_action :authenticate_admin!

  def index
    @law_regulations = LawRegulation.all
  end

  def show
    @law_regulation = LawRegulation.find(params[:id])
  end

  def new
    @law_regulation = LawRegulation.new
  end

  def create
    @law_regulation = LawRegulation.new(law_regulation_params)
    
    if @law_regulation.save
      puts @law_regulation
      flash[:notice] = "Law Regulation has been created successfully"
      redirect_to law_regulations_path
    else
      flash[:warning] = "Error file size"
      render 'new'
    end
  end

  def edit
    @law_regulation = LawRegulation.find(params[:id])
  end

  def update
    @law_regulation = LawRegulation.find(params[:id])

    if(@law_regulation.update_attributes(law_regulation_params))
      flash[:notice] = "Law Regulation has been updated successfully"
      redirect_to law_regulations_path
    else
      flash[:warning] = "Updated not success!"
      render "edit"
    end
  end

  private
  def law_regulation_params
    params.require(:law_regulation).permit(:title, :description, :thumbnail, :law_doc_attachment)
  end

end
