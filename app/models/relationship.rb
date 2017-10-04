# == Schema Information
#
# Table name: relationships
#
#  id                       :integer          not null, primary key
#  relationship_type_id     :integer
#  participant_owner_uuid   :string(255)
#  uuid                     :string(255)
#  participant_related_uuid :string(255)
#  created_at               :datetime
#  updated_at               :datetime
#  deleted_at               :datetime
#

class Relationship < ActiveRecord::Base
  belongs_to :participant, foreign_key: :participant_owner_uuid, primary_key: :uuid
  belongs_to :relationship_type
  belongs_to :participant_owner, class_name: 'Participant', foreign_key: :participant_owner_uuid
  belongs_to :participant_related, class_name: 'Participant', primary_key: :uuid, foreign_key: :participant_related_uuid
  acts_as_paranoid
  has_paper_trail on: %i[update destroy], ignore: %i[id created_at updated_at]
end
