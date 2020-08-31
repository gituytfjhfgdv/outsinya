class AddUserRefToDailyLastTweetIdForUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :daily_last_tweet_id_for_users, :user, null: false,
                                                         foreign_key: true,
                                                         type: :uuid
  end
end
