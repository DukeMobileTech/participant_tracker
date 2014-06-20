class ParticipantType < ActiveRecord::Base
  has_many :participants
  has_many :properties
  belongs_to :property, foreign_key: :label_property, primary_key: :id
  acts_as_paranoid
end
