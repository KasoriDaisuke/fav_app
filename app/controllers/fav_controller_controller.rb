class FavControllerController < ApplicationController
	before_action :authenticate_user!
	
  def index
  	@microposts = Micropost.all.order(created_at: "ASC")
  end

  def show
  end
end
