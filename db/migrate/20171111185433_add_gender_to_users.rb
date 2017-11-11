class AddGenderToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :gender, :text, array: true, default: []
  end
end
