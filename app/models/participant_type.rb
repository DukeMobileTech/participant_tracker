# == Schema Information
#
# Table name: participant_types
#
#  id             :integer          not null, primary key
#  label          :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  label_property :integer
#  deleted_at     :datetime
#

class ParticipantType < ActiveRecord::Base
  has_many :participants
  has_many :properties
  belongs_to :property, foreign_key: :label_property, primary_key: :id
  acts_as_paranoid
end
