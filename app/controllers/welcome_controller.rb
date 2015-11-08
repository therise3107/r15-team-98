class WelcomeController < ApplicationController
  def index
  end

  def show
  	@hit = Tag.friendly.find(params[:id])
  end
end
