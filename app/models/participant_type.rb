class ParticipantType < ActiveRecord::Base
  has_many :participants
  has_many :properties
end
