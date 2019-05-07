class AddFavToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :fav, :bigint
  end
end
