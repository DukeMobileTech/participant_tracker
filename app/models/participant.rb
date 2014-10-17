# == Schema Information
#
# Table name: participants
#
#  id                  :integer          not null, primary key
#  participant_type_id :integer
#  created_at          :datetime
#  updated_at          :datetime
#  uuid                :string(255)
#  deleted_at          :datetime
#  device_uuid         :string(255)      default("")
#  device_label        :string(255)      default("")
#

class Participant < ActiveRecord::Base
  has_many :participant_properties, foreign_key: :participant_uuid, primary_key: :uuid
  has_many :relationships, foreign_key: :participant_owner_uuid, primary_key: :uuid
  belongs_to :participant_type
  delegate :label, to: :participant_type
  acts_as_paranoid
end
