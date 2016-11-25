class UsersController < ApplicationController

  skip_before_action :require_login, only: [:new,:create]
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    # todo: current userだけ許可
  end

  def create
    @user = User.new(user_params)
    # binding.pry
    if @user.save
      login(user_params[:username],user_params[:password])
      redirect_to root_path, notice: "Welcome to msg app, #{current_user.username}"
    else
      render :new, notice: "Failed to signin"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
