class ContactsController < ApplicationController
  before_action :set_contact, only: [:edit, :update,:destroy]
  before_action :authenticate_admin!
  layout 'administrator'
  
  def index
    @contact = Contact.first
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

  private
  def set_contact
    @contact = Contact.find(params[:id])
  end
  def contact_params
    params.require(:contact).permit(:address, :phone, :fax, :email, :latitude, :longitude, :zoom_level)
  end
end
