class LawRegulationsController < ApplicationController
  layout 'administrator'
  before_action :authenticate_admin!

  def index
    
  end

  def new
    @law_regulation = LawRegulation.new
  end

  def create
    
  end

end
