class AdminsController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :authenticate_admin!
  before_action :check_admin
  layout 'administrator'
  def index
    @users = Admin.get_users
  end
  
  def new
    @user = Admin.new
    @user.build_user_profile
  end
  
  def create
    @user = Admin.create(admin_params)
    if @user.save
      flash[:notice] = "user create success"
      redirect_to admins_path
    else
      flash[:warning] = "save unsuccess !"
      # @user.build_user_profile
      render 'new'
    end
  end

  def edit
    if @user.user_profile.nil?
      @user.build_user_profile
    end
  end

  def update
    if @user.admin == false
      @user.update_attributes(admin_params)
      if @user.save
        flash[:notice] = "user Update success"
        redirect_to admins_path
      else
        flash[:warning] = "Update unsuccess!"
        render 'edit'
      end
    else
      flash[:warning] = "Update unsuccess!"
      render 'edit'
    end
  end

  def deactive
    
  end

  def destroy
    if @user.admin == false
      if @user.destroy
        @user.user_profile.destroy
        flash[:notice] = "#{@user.username} has deleted!"
        redirect_to admins_path
      else
        flash[:warning] = "Cannot delete #{@user.username} !"
        redirect_to admins_path
      end
    else
      flash[:warning] = "Cannot delete #{@user.username} !"
      redirect_to admins_path
    end
  end


  private

    def check_admin
      if current_admin.admin == false
        flash[:warning] = "You don't have permission!"
        redirect_to administrator_index_path
      end
    end

    def admin_params
      defaults = {:admin => false, :active => true}
      params.require(:admin).permit(
        :username,
        :email,
        :password,
        :password_confirmation,
        user_profile_attributes:[:name, :address, :phone, :position]
        ).merge(defaults)
    end

    def set_user
      @user = Admin.find(params[:id])
    end
end
