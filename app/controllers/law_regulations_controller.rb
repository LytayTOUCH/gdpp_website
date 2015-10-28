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

  private
  def law_regulation_params
    params.require(:law_regulation).permit(:title, :description, :thumbnail, :law_doc_attachment)
  end

end
