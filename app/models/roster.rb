# == Schema Information
#
# Table name: rosters
#
#  id                        :integer          not null, primary key
#  uuid                      :string(255)
#  identifier                :string(255)
#  instrument_title          :string(255)
#  instrument_id             :integer
#  instrument_version_number :integer
#  created_at                :datetime
#  updated_at                :datetime
#

class Roster < ActiveRecord::Base
  has_many :surveys, foreign_key: :roster_uuid, primary_key: :uuid, dependent: :destroy
  has_paper_trail on: %i[update destroy]
end
