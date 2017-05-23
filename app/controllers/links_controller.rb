class LinksController < ApplicationController
  before_action :check_registered_user

  def index
    @links = Link.all
  end

  def create
    link = Link.new(link_params)
    if link.save
      flash[:notice] = "Link #{link.title} created!"
      redirect_to root_path
    else
      flash[:danger] = "Title or URL are Incorrect"
      render :new
    end
  end


private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
