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
#  validator           :string(255)      default("")
#  include_in_metadata :boolean          default(FALSE)
#

class Property < ActiveRecord::Base
  default_scope { order('id ASC') }

  has_many :participant_properties, dependent: :destroy
  belongs_to :participant_type
  acts_as_paranoid

  def to_s
    label
  end
end
