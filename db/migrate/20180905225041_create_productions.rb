class CreateProductions < ActiveRecord::Migration[5.2]
  def change
    create_table :productions do |t|
      t.string :logo_path
      t.string :name
      t.string :origin_country

      t.timestamps
    end
    add_index :productions, :name
    add_index :productions, :origin_country
  end
end
