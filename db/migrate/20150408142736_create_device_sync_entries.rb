class CreateDeviceSyncEntries < ActiveRecord::Migration
  def change
    create_table :device_sync_entries do |t|
      t.integer :current_version
      t.string :current_language
      t.string :device_uuid
      t.string :device_label
      t.string :timezone
      t.string :participant_types
      t.integer :participant_count

      t.timestamps
    end
  end
end
