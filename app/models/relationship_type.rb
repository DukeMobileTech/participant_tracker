# == Schema Information
#
# Table name: relationship_types
#
#  id                          :integer          not null, primary key
#  participant_type_owner_id   :integer
#  participant_type_related_id :integer
#  label                       :string(255)
#  created_at                  :datetime
#  updated_at                  :datetime
#  deleted_at                  :datetime
#

class RelationshipType < ActiveRecord::Base
  has_many :relationships, dependent: :destroy
  belongs_to :participant_type_owner, class_name: "ParticipantType", foreign_key: :participant_type_owner_id
  belongs_to :participant_type_related, class_name: "ParticipantType", foreign_key: :participant_type_related_id
  acts_as_paranoid
end
