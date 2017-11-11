class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :zip_code
      t.inet :original_ip
      t.inet :current_ip
      t.macaddr :mac_address
      t.string :email
      t.string :password
      t.string :password_digest

      t.timestamps
    end
  end
end
