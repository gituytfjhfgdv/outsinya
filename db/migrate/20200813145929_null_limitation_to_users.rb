class NullLimitationToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :nickname, false
    change_column_null :users, :uid, false
  end
end
