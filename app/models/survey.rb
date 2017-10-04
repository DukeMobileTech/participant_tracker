# == Schema Information
#
# Table name: surveys
#
#  id                        :integer          not null, primary key
#  instrument_id             :integer
#  instrument_version_number :integer
#  device_uuid               :string(255)
#  device_label              :string(255)
#  uuid                      :string(255)
#  instrument_title          :string(255)
#  latitude                  :string(255)
#  longitude                 :string(255)
#  metadata                  :text
#  has_critical_responses    :boolean
#  roster_uuid               :string(255)
#  created_at                :datetime
#  updated_at                :datetime
#

class Survey < ActiveRecord::Base
  belongs_to :roster, foreign_key: :roster_uuid, primary_key: :uuid
  has_many :responses, foreign_key: :survey_uuid, primary_key: :uuid, dependent: :destroy
  has_paper_trail on: %i[update destroy]
end
