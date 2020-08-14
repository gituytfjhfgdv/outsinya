class ChangeUserWordTableName < ActiveRecord::Migration[6.0]
  def change
    rename_table :negative_words, :personal_words
    drop_table :positive_words
  end
end
