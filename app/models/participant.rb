# == Schema Information
#
# Table name: participants
#
#  id                  :integer          not null, primary key
#  participant_type_id :integer
#  created_at          :datetime
#  updated_at          :datetime
#  uuid                :string(255)
#  deleted_at          :datetime
#  device_uuid         :string(255)      default("")
#  device_label        :string(255)      default("")
#  project_id          :integer
#  active              :boolean          default(FALSE)
#  validator_value     :string(255)      default("")
#

class Participant < ActiveRecord::Base
  has_many :participant_properties, -> { order('property_id ASC') }, foreign_key: :participant_uuid, primary_key: :uuid, dependent: :destroy
  has_many :relationships, foreign_key: :participant_owner_uuid, primary_key: :uuid, dependent: :destroy
  belongs_to :participant_type
  belongs_to :project
  delegate :label, to: :participant_type
  acts_as_paranoid
  has_paper_trail on: %i[update destroy], ignore: %i[id created_at updated_at]
  before_destroy :delete_related_relationships
  after_save :set_active_status, if: :active_changed? && :center?
  paginates_per 100

  # Scopes for active admin
  ParticipantType.all.each do |pt|
    scope pt.pretty_label, -> { where(participant_type_id: pt.id) }
  end

  def set_active_status
    center_participants.update_all(active: active, updated_at: Time.now.utc) if center_participants
  end

  def validator
    if participant_type.validator
      participant_properties.where(property_id: participant_type.validator.id).try(:first)
    end
  end

  def center_participants
    return unless center?
    Participant.where('validator_value = ? AND participant_type_id != ?', validator_value, participant_type_id)
  end

  def center?
    participant_type.label.strip.casecmp('center').zero?
  end

  def properties_label
    properties = participant_type.properties.where(use_as_label: true)

    label = []
    participant_properties.all.each do |participant_property|
      properties.all.each do |property|
        if participant_property.property == property
          label << participant_property.value
        end
      end
    end

    label.join(' ')
  end

  def relationship_labels
    labels = []
    relationships.all.each do |relationship|
      labels << relationship.try(:participant_related).try(:properties_label)
    end
    labels
  end

  def delete_related_relationships
    related = Relationship.where('participant_related_uuid = ?', uuid)
    related.destroy_all
  end
end
