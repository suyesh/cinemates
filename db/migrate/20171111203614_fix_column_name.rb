class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :lists, :type, :list_type
  end
end
