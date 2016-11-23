class SessionsController < ApplicationController
  def new
    redirect_to user_path(current_user), :id => current_user if logged_in?
  end

  def create
    user = login(params[:username], params[:password], params[:remember_me])
    if user
      redirect_back_or_to user_path(user), notice: "Logged in!"
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
