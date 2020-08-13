class CreateNegativeWords < ActiveRecord::Migration[6.0]
  def change
    create_table :negative_words, id: :uuid do |t|
      t.string :content, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
