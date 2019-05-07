class ChangeDatatypeFavOfTweets < ActiveRecord::Migration[5.2]
  def change
  	change_column :tweets, :fav, :bigint
  end
end
