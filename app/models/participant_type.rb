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
  acts_as_paranoid

  def export
    CSV.generate do |csv|
      csv << properties.all + relationship_types.all + ['device_uuid', 'device_label']
      participants.each do |participant|
        values = []
        unless properties.all.blank?
          participant.participant_properties.blank? ? values.fill(" ", values.length, properties.size) : values += participant.participant_properties.collect(&:value)
        end
        unless relationship_types.all.blank?
          values += [participant.relationship_labels.join(' ')] 
        end
        csv << values + [participant.device_uuid, participant.device_label]
      end
    end
  end
end
