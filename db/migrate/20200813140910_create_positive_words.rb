class CreatePositiveWords < ActiveRecord::Migration[6.0]
  def change
    create_table :positive_words, id: :uuid do |t|
      t.string :content, null: false
      t.references :user, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
