class Property < ActiveRecord::Base
  has_many :participant_properties
  belongs_to :participant_type
end