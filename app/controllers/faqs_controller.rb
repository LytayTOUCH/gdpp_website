class FaqsController < ApplicationController
  before_action :set_faq, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  layout 'administrator'

  def index
    @faqs = Faq.all
  end

  def show
    @faq = Faq.find(params[:id])
  end

  def new
    @faq = Faq.new
  end

  def create
    @faq = Faq.new(faq_params)
    
    if @faq.save
      puts @faq
      flash[:notice] = "Faq has been created successfully"
      redirect_to faqs_path
    else
      flash[:warning] = "Faq cannot be created"
      render 'new'
    end
  end

  def edit
    @faq = Faq.find(params[:id])
  end

  def update
    @faq = Faq.find(params[:id])

    if(@faq.update_attributes(faq_params))
      flash[:notice] = "Law Regulation has been updated successfully"
      redirect_to faqs_path
    else
      flash[:warning] = "Updated not success!"
      render "edit"
    end
  end

  def destroy
    @faq.destroy
    flash[:notice] = "Delete successfully"
    redirect_to faqs_path
  end

  private
  def set_faq
    @faq = Faq.find(params[:id])
  end

  def faq_params
    params.require(:faq).permit(:question, :answer)
  end

end
