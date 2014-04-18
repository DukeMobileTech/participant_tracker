class CreateParticipantAttributes < ActiveRecord::Migration
  def change
    create_table :participant_attributes do |t|
      t.integer :participant_id
      t.integer :attribute_id
      t.string :value

      t.timestamps
    end
  end
end
