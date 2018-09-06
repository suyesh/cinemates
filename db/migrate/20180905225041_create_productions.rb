class CreateProductions < ActiveRecord::Migration[5.2]
  def change
    create_table :productions do |t|
      t.string :logo_path
      t.string :name
      t.string :origin_country
      t.integer :tmdb_id

      t.timestamps
    end
    add_index :productions, :name
    add_index :productions, :origin_country
    add_index :productions, :tmdb_id
  end
end
