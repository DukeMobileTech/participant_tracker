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
      csv << properties.all + relationship_types.all
      participants.each do |participant|
        participant_properties = participant.participant_properties.collect(&:value)
        relationship_property = [participant.relationship_labels.join(' ')]
        csv << participant_properties + relationship_property
      end
    end
  end
end
