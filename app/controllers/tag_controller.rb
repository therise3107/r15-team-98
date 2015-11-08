class TagController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
  end

  def show
  	@hit = Tag.friendly.find(params[:id])
  end

  def new
  	@tag = Tag.new
  end

  def create
  	@tag = Tag.new tag_params
  	if @tag.save
  		redirect_to root_path, notice: 'tag added'
  	else
  		redirect_to root_path, alert: 'something went wrong'
  	end
  end

  private
  def tag_params
  	params.require(:tag).permit(:name)
  end
end
