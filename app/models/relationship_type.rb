class RelationshipType < ActiveRecord::Base
  has_many :relationships
  acts_as_paranoid
end
