class Relationship < ActiveRecord::Base
  belongs_to :participant, foreign_key: :participant_owner_uuid, primary_key: :uuid
  belongs_to :relationship_type
end
