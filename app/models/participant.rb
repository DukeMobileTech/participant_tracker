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
#

class Participant < ActiveRecord::Base
  has_many :participant_properties, foreign_key: :participant_uuid, primary_key: :uuid, dependent: :destroy
  has_many :relationships, foreign_key: :participant_owner_uuid, primary_key: :uuid, dependent: :destroy
  belongs_to :participant_type
  delegate :label, to: :participant_type
  acts_as_paranoid
  before_destroy :delete_related_relationships
  paginates_per 100

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
    related = Relationship.where("participant_related_uuid = ?", uuid)
    related.destroy_all
  end
  
end
