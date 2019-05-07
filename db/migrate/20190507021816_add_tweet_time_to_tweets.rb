class AddTweetTimeToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :tweet_time, :datetime
  end
end
