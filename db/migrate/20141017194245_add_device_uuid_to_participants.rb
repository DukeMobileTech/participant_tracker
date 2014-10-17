class AddDeviceUuidToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :device_uuid, :string, default: ""
  end
end
