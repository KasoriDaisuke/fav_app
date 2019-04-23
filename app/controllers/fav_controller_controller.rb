class FavControllerController < ApplicationController
	before_action :authenticate_user!
	require 'twitter'
	
  def index
  	@microposts = Micropost.all.order(created_at: "ASC")
  end

  def twitter_data
     @client = Twitter::REST::Client.new do |config|
       config.consumer_key         = "VEQghqwqs5jcToGukIX1Z6GMO"
       config.consumer_secret      = "DMu3TB6V9ri7fuBPWIuFCX5HTmxb6dv6wYvsxu29jlvqyRQudw"
       config.access_token         = "346515691-8vNrpTukUMWuW1lIOz8DX47WgfnUzUA51peM782u"
       config.access_token_secret  = "T7csjUvJbGmryjdmC3DBx5HUtyABo5ryX9jiA23IqHRFe"
     end
   end

def homeTimeline
  @client.home_timeline.each do |tweet|
    puts "\e[33m" + tweet.user.name + "\e[32m" + "[ID:" + tweet.user.screen_name + "]"
    puts "\e[0m" + tweet.text
  end
end

  def show
  end
end
