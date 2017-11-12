class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.integer :type, index: true

      t.timestamps
    end
  end
end
