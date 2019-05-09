class FavControllerController < ApplicationController
	before_action :authenticate_user!
	require 'twitter'
	
  def index
    twitter_data
    get_tweet
    sort_test
  end

  def twitter_data
     @client = Twitter::REST::Client.new do |config|
       config.consumer_key         = Rails.application.credentials.twitter_api_key
       config.consumer_secret      = Rails.application.credentials.twitter_api_secret
       config.access_token         = Rails.application.credentials.twitter_token
       config.access_token_secret  = Rails.application.credentials.twitter_token_secret
     end
   end

   def sort_test
    @sort = params[:sort]
   end

  def get_tweet
    @client.user_timeline("ziro264", count:200).each do |tweet|
      @tweet =Tweet.new(user_id: current_user.id, tweet: tweet.text, fav: tweet.favorite_count, tweet_time: tweet.created_at, tweet_id: tweet.id)
      @tweet.save
    end
    if params[:sort] == "many"
      @tweets = Tweet.where(user_id: current_user.id).order(fav: "DESC")
    elsif params[:sort] == "few"
      @tweets = Tweet.where(user_id: current_user.id).order(fav: "ASC")
    elsif params[:sort] == "new"
      @tweets = Tweet.where(user_id: current_user.id).order(tweet_time: "DESC")
    elsif params[:sort] == "old"
      @tweets = Tweet.where(user_id: current_user.id).order(tweet_time: "ASC")
    end
  end

end
