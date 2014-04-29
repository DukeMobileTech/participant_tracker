class AddLabelPropertyToParticipantType < ActiveRecord::Migration
  def change
    add_column :participant_types, :label_property, :integer
    change_column :participant_properties, :participant_id, :string
    rename_column :participant_properties, :participant_id, :participant_uuid 
  end
end
