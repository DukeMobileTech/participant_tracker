# == Schema Information
#
# Table name: participant_types
#
#  id         :integer          not null, primary key
#  label      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  deleted_at :datetime
#

class ParticipantType < ActiveRecord::Base
  has_many :participants
  has_many :properties
  acts_as_paranoid
end
