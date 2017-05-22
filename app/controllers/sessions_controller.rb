class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:session][:username])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:danger] = "Name or Password are Incorrect"
      render :new
    end
  end

  def destroy
      session.clear
      flash[:notice] = "You have successfully logged out"
      redirect_to signup_path
  end
end