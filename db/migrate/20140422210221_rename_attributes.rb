class RenameAttributes < ActiveRecord::Migration
  def change
    rename_column :attributes, :type, :type_of
    rename_table :attributes, :properties
  end
end
