class CreateSpokenLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :spoken_languages do |t|
      t.string :name
      t.string :iso_639_1

      t.timestamps
    end
    add_index :spoken_languages, :name
    add_index :spoken_languages, :iso_639_1
  end
end
