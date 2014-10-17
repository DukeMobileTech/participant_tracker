class AddDeviceLabelToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :device_label, :string, default: ""
  end
end
