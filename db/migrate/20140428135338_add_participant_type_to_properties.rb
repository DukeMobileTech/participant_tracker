class AddParticipantTypeToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :participant_type_id, :integer
  end
end
