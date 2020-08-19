class AddAllCommentCountToDailyRecord < ActiveRecord::Migration[6.0]
  def change
    add_column :daily_user_word_records, :all_daily_word_count, :integer
  end
end
