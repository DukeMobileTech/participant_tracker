class RenameParticipantPropertiesColumns < ActiveRecord::Migration
  def change
    change_column :participant_properties, :participant_uuid, :integer
    rename_column :participant_properties, :participant_uuid, :participant_id
    add_column :participant_properties, :participant_uuid, :string
  end
end
