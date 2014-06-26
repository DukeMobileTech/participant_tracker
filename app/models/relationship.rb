class Relationship < ActiveRecord::Base
  belongs_to :participant, foreign_key: :participant_owner_uuid, primary_key: :uuid
  belongs_to :relationship_type
  belongs_to :participant_owner, class_name: "Participant", foreign_key: :participant_owner_uuid
  belongs_to :participant_related, class_name: "Participant", foreign_key: :participant_related_uuid
  acts_as_paranoid
end
