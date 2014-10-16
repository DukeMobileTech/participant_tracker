class AddAttachmentApkUpdateToAndroidUpdates < ActiveRecord::Migration
  def self.up
    change_table :android_updates do |t|
      t.attachment :apk_update
    end
  end

  def self.down
    remove_attachment :android_updates, :apk_update
  end
end
