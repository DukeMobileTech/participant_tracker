class DeleteParticipantPropertyIdFromParticipant < ActiveRecord::Migration
  def change
    remove_column :participants, :participant_property_id 
  end
end
