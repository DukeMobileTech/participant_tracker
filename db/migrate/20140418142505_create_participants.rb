class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.integer :participant_type_id

      t.timestamps
    end
  end
end
