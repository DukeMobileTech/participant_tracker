class ParticipantProperty < ActiveRecord::Base
  belongs_to :participant 
  belongs_to :property
  delegate :label, to: :property
  
end
