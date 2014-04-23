class ParticipantProperty < ActiveRecord::Base
  has_many :properties 
  belongs_to :participant 
end
