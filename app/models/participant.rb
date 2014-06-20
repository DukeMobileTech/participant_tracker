class Participant < ActiveRecord::Base
  has_many :participant_properties, foreign_key: :participant_uuid, primary_key: :uuid
  belongs_to :participant_type
  delegate :label, to: :participant_type
  acts_as_paranoid
end
