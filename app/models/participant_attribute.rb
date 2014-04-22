class ParticipantAttribute < ActiveRecord::Base
  has_many :properties 
  belongs_to :participant 
end
