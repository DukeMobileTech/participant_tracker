class CreateParticipantTypes < ActiveRecord::Migration
  def change
    create_table :participant_types do |t|
      t.string :label

      t.timestamps
    end
  end
end
