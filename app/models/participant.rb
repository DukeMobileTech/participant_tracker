class Participant < ActiveRecord::Base
  has_many :participant_attributes
  belongs_to :participant_type
end
