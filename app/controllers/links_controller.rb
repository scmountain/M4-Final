class LinksController < ApplicationController
  before_action :check_registered_user

  def index
    @links = Link.where(["user_id = ?","#{current_user.id}"])
  end

  def create
    link = current_user.links.new(link_paclass LinksController < ApplicationController
    before_action :check_registered_user
    skip_before_filter :verify_authenticity_token, :only => [:create]
  def index
    @links = current_user.links
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    @link.update_attributes(link_params)
    if @link.save
      flash[:notice] = "Link #{@link.title} updated!"
      redirect_to root_path
    else
      flash[:error] = format_errors(@link.errors.full_messages)
      render :edit
    end
end


private

  def format_errors(errors)
    errors.reduce(:+)
  end

  def link_params
    params.require(:link).permit(:title, :url, :user_id)
  end
end
rams)
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
