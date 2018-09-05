class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :iso_3166_1

      t.timestamps
    end
    add_index :countries, :name
    add_index :countries, :iso_3166_1
  end
end
