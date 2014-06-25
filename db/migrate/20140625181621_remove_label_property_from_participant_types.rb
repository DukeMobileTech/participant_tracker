class RemoveLabelPropertyFromParticipantTypes < ActiveRecord::Migration
  def change
    remove_column :participant_types, :label_property
  end
end
