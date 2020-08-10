class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :nickname
      t.string :icon_image

      t.timestamps
    end
  end
end
