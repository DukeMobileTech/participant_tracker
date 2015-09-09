# == Schema Information
#
# Table name: devices
#
#  id         :integer          not null, primary key
#  uuid       :string(255)
#  label      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Device < ActiveRecord::Base
  has_many :device_sync_entries, foreign_key: :device_uuid, primary_key: :uuid

  def uptodate?
    if last_sync_entry
      !danger_zone? && last_sync_entry.current_version == (AndroidUpdate.latest_version.version if AndroidUpdate.latest_version)
    end
  end

  def danger_zone?
    if last_sync_entry
      last_sync_entry.updated_at <= Settings.danger_zone_days.days.ago
    end
  end

  def last_sync_entry
    device_sync_entries.order('updated_at ASC').last
  end
end