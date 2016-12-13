# == Schema Information
#
# Table name: responses
#
#  id                  :integer          not null, primary key
#  survey_uuid         :string(255)
#  question_id         :integer
#  text                :text
#  other_response      :text
#  special_response    :string(255)
#  time_started        :datetime
#  time_ended          :datetime
#  question_identifier :string(255)
#  uuid                :string(255)
#  question_version    :integer
#  device_user_id      :integer
#  created_at          :datetime
#  updated_at          :datetime
#

class Response < ActiveRecord::Base
  belongs_to :survey, foreign_key: :survey_uuid, primary_key: :uuid
end