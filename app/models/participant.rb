class Participant < ActiveRecord::Base
  has_many :participant_attributes
  has_many :participant_types
end
