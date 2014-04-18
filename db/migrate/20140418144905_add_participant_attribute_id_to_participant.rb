class AddParticipantAttributeIdToParticipant < ActiveRecord::Migration
  def change
    add_column :participants, :participant_attribute_id, :integer 
  end
end
