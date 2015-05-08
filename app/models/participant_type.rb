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
  acts_as_paranoid

  def export
    CSV.generate do |csv|
      csv << properties.all
      participants.each do |participant|
        participant_properties = []
        participant.participant_properties.each do |participant_property|
          participant_properties << participant_property.value
        end
        csv << participant_properties
      end
    end 
  end
end
