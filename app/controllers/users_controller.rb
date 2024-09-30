class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def profile
    @user = User.find(params[:id])
    @blogs = @user.blogs
  end

  def show
  end
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :dob, :avatar, :password, :password_confirmation)
  end
end
