class FavControllerController < ApplicationController
  def index
  	@microposts = Micropost.all
  end

  def show
  end
end
