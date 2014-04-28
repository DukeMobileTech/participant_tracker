class AddUuidToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :uuid, :string
    add_column :participant_properties, :uuid, :string
  end
end
