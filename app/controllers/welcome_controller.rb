class WelcomeController < ApplicationController
  def index
  end

  def show
  	@q = params[:id]
  	@hits = Tag.friendly.find(@q)

  end
end
