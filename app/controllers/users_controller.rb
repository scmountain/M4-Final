class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    require "pry"; binding.pry
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
      flash[:notice] = "Logged in as #{@user.name}"
    else
      redirect_to '/signup'
      flash[:error] = "Must have valid name, email, and password"
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
