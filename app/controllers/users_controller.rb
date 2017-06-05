class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
      flash[:notice] = "Logged in as #{user.name}"
    else
      flash[:error] = format_errors(user.errors.full_messages)
      redirect_to '/signup'
    end
end

private

  def format_errors(errors)
    errors.reduce(:+)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
