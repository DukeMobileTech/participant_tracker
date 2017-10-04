# == Schema Information
#
# Table name: participant_properties
#
#  id               :integer          not null, primary key
#  property_id      :integer
#  value            :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  uuid             :string(255)
#  participant_uuid :string(255)
#  deleted_at       :datetime
#

class ParticipantProperty < ActiveRecord::Base
  belongs_to :participant, foreign_key: :participant_uuid, primary_key: :uuid
  belongs_to :property
  delegate :label, to: :property
  acts_as_paranoid
  after_save :update_validator, if: :value_changed? && :same_property?
  has_paper_trail on: %i[update destroy], ignore: %i[id created_at updated_at]

  def same_property?
    return false unless participant.validator
    participant.validator.property_id == property_id
  end

  def update_validator
    if participant.center?
      participant.update(validator_value: value)
    else
      participant.update(validator_value: value.split('-')[1])
    end
  end
end
