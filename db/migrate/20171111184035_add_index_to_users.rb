class AddIndexToUsers < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :username, unique: true
    add_index :users, :zip_code
    add_index :users, :email, unique: true
  end
end
