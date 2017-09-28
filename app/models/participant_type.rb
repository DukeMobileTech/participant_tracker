# == Schema Information
#
# Table name: participant_types
#
#  id         :integer          not null, primary key
#  label      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  deleted_at :datetime
#

class ParticipantType < ActiveRecord::Base
  has_many :participants, dependent: :destroy
  has_many :properties, dependent: :destroy
  has_many :relationship_types, foreign_key: :participant_type_owner_id, dependent: :destroy
  has_one :validator, -> { where.not(validator: '') }, class_name: 'Property'
  acts_as_paranoid

  def pretty_label
    label.downcase.gsub(/\W+/, '_')
  end

  def export
    CSV.generate do |csv|
      if label.strip.casecmp('child').zero?
        csv << properties.all + ['participant_uuid'] + relationship_types.all + %w[caregiver_uuid device_uuid device_label]
      else
        csv << properties.all + ['participant_uuid'] + relationship_types.all + %w[device_uuid device_label]
      end
      participants.each do |participant|
        values = []
        unless properties.all.blank?
          participant.participant_properties.blank? ? values.fill(' ', values.length, properties.size) :
              values += participant.participant_properties.collect(&:value)
        end
        values += [participant.uuid]
        unless relationship_types.all.blank?
          values += [participant.relationship_labels.join(' ')]
        end
        if label.strip.casecmp('child').zero?
          values += [participant.relationships.pluck(:participant_related_uuid).join(' ')]
        end
        csv << values + [participant.device_uuid, participant.device_label]
      end
    end
  end
end
