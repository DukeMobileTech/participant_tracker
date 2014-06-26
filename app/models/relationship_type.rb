class RelationshipType < ActiveRecord::Base
  has_many :relationships
  belongs_to :participant_type_owner, class_name: "ParticipantType", foreign_key: :participant_type_owner_id
  belongs_to :participant_type_related, class_name: "ParticipantType", foreign_key: :participant_type_related_id
  acts_as_paranoid
end
