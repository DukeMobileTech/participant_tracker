class Participant < ActiveRecord::Base
  has_many :participant_properties
  belongs_to :participant_type
  delegate :label, to: :participant_type
  
end
