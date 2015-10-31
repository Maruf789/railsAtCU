class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, :except => :show

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def admin_only
    unless current_user.admin?
      redirect_to :back, :alert => "Access denied."
    end
  end

  def secure_params
    params.require(:user).permit(:role)
  end

#begin
  def create
    # Using params[:user] without calling user_params will throw an error because 
    # the parameters were not filtered. This is just some Rails magic.
    @user = User.new user_params
    if @user.save
      # Do whatever
    else
      render action: :new
    end
  end
 private
  def user_params
    # params.require(:user) throws an error if params[:user] is nil

    if current_user.nil? # Guest
      # Remove all keys from params[:user] except :name, :email, :password, and :password_confirmation
      params.require(:user).permit :name, :email, :password, :password_confirmation
    elsif current_user.has_role :admin
      params.require(:user).permit! # Allow all user parameters
    elsif current_user.has_role :user
      params.require(:user).permit :name, :email, :password, :password_confirmation
    end
  end
#end

end
