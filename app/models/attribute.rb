class Attribute < ActiveRecord::Base
  self.inheritance_column = nil #To allow use of column named 'type' 
  belongs_to :participant_attributes
  
end
