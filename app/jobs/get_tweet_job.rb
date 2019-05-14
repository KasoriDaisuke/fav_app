class GetTweetJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key         = Rails.application.credentials.twitter_api_key
      config.consumer_secret      = Rails.application.credentials.twitter_api_secret
      config.access_token         = Rails.application.credentials.twitter_token
      config.access_token_secret  = Rails.application.credentials.twitter_token_secret
    end

    User.all.each do |user|
      @client.user_timeline(user.uid.to_i, count:200).each do |tweet|
        @tweet =Tweet.new(user_id: user.nickname, tweet: tweet.text, fav: tweet.favorite_count, tweet_time: tweet.created_at, tweet_id: tweet.id)
        @tweet.save
      end
    end
	end
end