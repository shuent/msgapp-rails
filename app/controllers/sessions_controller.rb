class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new,:create]
  def new
    redirect_to root_path if logged_in?
  end

  def create
    user = login(params[:username], params[:password], params[:remember_me])
    # binding.pry
    if user
      redirect_back_or_to root_path, notice: "Welcome back, #{current_user.username}"
    else
      flash.now[:alert] = "Failed to login"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: "Logged out!"
  end
end
