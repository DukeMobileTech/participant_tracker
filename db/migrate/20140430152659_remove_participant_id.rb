class RemoveParticipantId < ActiveRecord::Migration
  def change
    remove_column :participant_properties, :participant_id
  end
end
