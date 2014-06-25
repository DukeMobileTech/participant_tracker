# == Schema Information
#
# Table name: participant_properties
#
#  id               :integer          not null, primary key
#  property_id      :integer
#  value            :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  uuid             :string(255)
#  participant_uuid :string(255)
#  deleted_at       :datetime
#

class ParticipantProperty < ActiveRecord::Base
  belongs_to :participant, foreign_key: :participant_uuid, primary_key: :uuid
  belongs_to :property
  delegate :label, to: :property
  acts_as_paranoid
end
