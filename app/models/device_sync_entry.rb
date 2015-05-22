# == Schema Information
#
# Table name: device_sync_entries
#
#  id                :integer          not null, primary key
#  current_version   :integer
#  current_language  :string(255)
#  device_uuid       :string(255)
#  device_label      :string(255)
#  timezone          :string(255)
#  participant_types :string(255)
#  participant_count :integer
#  created_at        :datetime
#  updated_at        :datetime
#

class DeviceSyncEntry < ActiveRecord::Base
  paginates_per 100
  
  def participant_types
    types = read_attribute(:participant_types)
    types[1..-2] if types
  end
  
end
