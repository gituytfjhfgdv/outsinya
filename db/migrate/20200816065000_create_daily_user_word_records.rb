class CreateDailyUserWordRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_user_word_records, id: :uuid do |t|
      t.references :user, null: false, type: :uuid, foreign_key: true
      t.references :personal_word, null: false, type: :uuid, foreign_key: true
      t.integer :count, null: false
      t.datetime :created_on

      t.timestamps
    end
  end
end
