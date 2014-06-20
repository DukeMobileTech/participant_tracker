class ParticipantProperty < ActiveRecord::Base
  belongs_to :participant, foreign_key: :participant_uuid, primary_key: :uuid
  belongs_to :property
  delegate :label, to: :property
  acts_as_paranoid
end
