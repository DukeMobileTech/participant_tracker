class RenameColumnAttributeId < ActiveRecord::Migration
  def change
    rename_column :participant_attributes, :attribute_id, :property_id 
  end
end
