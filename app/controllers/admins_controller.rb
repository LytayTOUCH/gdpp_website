class AdminsController < ApplicationController
  # before_action :set_announcement, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  layout 'administrator'
  def index
    @users = Admin.all
  end
  
  def new
    @user = Admin.new
    @user.build_user_profile
  end
  
  def create
    @user = Admin.new(admin_params)
    if @user.save
      flash[:success] = "user creae success"
      redirect_to admins_path
    else
      flash[:warning] = "save unsuccess !"
      @user.build_user_profile
      render 'new'
    end
  end

  def edit
    
  end

  def update
    
  end

  def deactive
    
  end

  private
    def user_profile_params
      params.require(:admin).permit(
        :name,
        :address,
        :phone,
        :position
        )
    end
    def admin_params
      params.require(:admin).permit(
        :username,
        :email,
        :password,
        :password_confirmation,
        user_profile_attributes:[user_profile_params]
        )
    end
    

end
