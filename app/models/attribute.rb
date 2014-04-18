class Attribute < ActiveRecord::Base
  belongs_to :participant
  belongs_to :attribute 
end
