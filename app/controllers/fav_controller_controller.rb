class FavControllerController < ApplicationController
  def index
  	@microposts = Micropost.all.order(created_at: "ASC")
  end

  def show
  end
end
