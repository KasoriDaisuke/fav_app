class FavControllerController < ApplicationController
  before_action :authenticate_user!
  require 'twitter'
  
  def index
    twitter_data
    # get_tweet
  end

  def twitter_data
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key         = Rails.application.credentials.twitter_api_key
      config.consumer_secret      = Rails.application.credentials.twitter_api_secret
      config.access_token         = Rails.application.credentials.twitter_token
      config.access_token_secret  = Rails.application.credentials.twitter_token_secret
    end

    User.all.each do |user|
      @client.user_timeline(user.uid.to_i, count:200).each do |tweet|
        @tweet =Tweet.new(user_id: user.uid.to_i, tweet: tweet.text, fav: tweet.favorite_count, tweet_time: tweet.created_at, tweet_id: tweet.id)
        @tweet.save
      end
    end

    @tweets = Tweet.where(user_id: 105110241)
    case params[:sort]
      when "many"
        @tweets = @tweets.order(fav: "DESC")
      when "few"
        @tweets = @tweets.order(fav: "ASC")
      when "new"
        @tweets = @tweets.order(tweet_time: "DESC")
      when "old"
        @tweets = @tweets.order(tweet_time: "ASC")
    end
  end
end