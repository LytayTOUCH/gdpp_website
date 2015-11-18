class ContactsController < ApplicationController
  before_action :set_contact, only: [:edit, :update,:destroy]
  before_action :authenticate_admin!
  layout 'administrator'
  
  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "Create success!"
      redirect_to contacts_path
    else
      flash[:warning] = "Create unsuccess!"
      render "new"
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end
  
  def update
    @contact = Contact.find(params[:id])

    if @contact.update_attributes(contact_params)
      flash[:notice] = "Update success!"
      redirect_to contacts_path
    else
      flash[:warning] = "Update unsuccess!"
      render "edit"
    end
  end
  
  def destroy
    @contact.destroy
    flash[:notice] = "Delete success"
    redirect_to contacts_path
  end

  private
  def set_contact
    @contact = Contact.find(params[:id])
  end
  def contact_params
    params.require(:contact).permit(:location_name, :phone_one, :phone_two, :phone_three, :email_one, :email_two, :email_three, :address_one, :address_two, :address_three)
  end
end
