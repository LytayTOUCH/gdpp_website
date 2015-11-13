class CurrentProfilesController < ApplicationController
  before_action :authenticate_admin!
  layout 'administrator'

  def edit
    set_profile
  end

  def update
    set_profile
    @profile.update_attributes(admin_params)
    if @profile.save
      flash[:notice] = "Your profile update success"
      redirect_to administrator_index_path
    else
      flash[:warning] = "Can't not update your profile"
      render 'edit'
    end
  end

  private

    def set_profile
      @profile = Admin.find(current_admin.id)
    end

    def admin_params
      if params[:admin][:password].blank?
        params.require(:admin).permit(
          :username,
          :email,
          user_profile_attributes:[:name, :address, :phone, :position]
        )
      else
        params.require(:admin).permit(
          :username,
          :email,
          :password,
          :password_confirmation,
          user_profile_attributes:[:name, :address, :phone, :position]
        )
      end
    end

end
