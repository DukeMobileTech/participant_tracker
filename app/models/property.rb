# == Schema Information
#
# Table name: properties
#
#  id                  :integer          not null, primary key
#  label               :string(255)
#  type_of             :string(255)
#  required            :boolean
#  created_at          :datetime
#  updated_at          :datetime
#  participant_type_id :integer
#  deleted_at          :datetime
#  use_as_label        :boolean          default(FALSE)
#

class Property < ActiveRecord::Base
  has_many :participant_properties
  belongs_to :participant_type
  acts_as_paranoid
end
