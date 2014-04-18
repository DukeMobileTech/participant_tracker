class ParticipantAttribute < ActiveRecord::Base
  has_many :attributes 
  belongs_to :participant 
end
