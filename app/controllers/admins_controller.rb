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
      flash[:notice] = t('message.success.create')
      redirect_to admins_path
    else
      flash[:warning] = t('message.unsuccess.create')
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
        flash[:notice] = t('message.success.update')
        redirect_to admins_path
      else
        flash[:warning] = t('message.unsuccess.update')
        render 'edit'
      end
    else
      flash[:warning] = t('message.unsuccess.update')
      render 'edit'
    end
  end

  def destroy
    if @user.admin == false
      if @user.destroy
        @user.user_profile.destroy
        flash[:notice] = @user.username  + t('message.success.delete')
        redirect_to admins_path
      else
        flash[:warning] = @user.username  + t('message.unsuccess.delete')
        redirect_to admins_path
      end
    else
      flash[:warning] = @user.username  + t('message.unsuccess.delete')
      redirect_to admins_path
    end
  end
  private
    def check_admin
      if current_admin.admin == false
        flash[:warning] = t('message.permission_deny')
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
