class RenameAttributesToProperties < ActiveRecord::Migration
  def change
    rename_column :participants, :participant_attribute_id, :participant_property_id
    rename_table :participant_attributes, :participant_properties
  end
end
