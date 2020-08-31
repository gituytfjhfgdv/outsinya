class CreateDailyLastTweetIdForUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_last_tweet_id_for_users, id: :uuid do |t|
      t.integer :tweet_id

      t.timestamps
    end
  end
end
