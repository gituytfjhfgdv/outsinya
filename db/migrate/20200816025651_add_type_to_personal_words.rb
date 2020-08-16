class AddTypeToPersonalWords < ActiveRecord::Migration[6.0]
  def change
    add_column :personal_words, :type, :string
    add_index :personal_words, :type
  end
end
