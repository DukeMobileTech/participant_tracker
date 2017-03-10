# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  deleted_at  :datetime
#

# Data silo
class Project < ActiveRecord::Base
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :participants
  has_many :relationships, through: :participants
  has_many :participant_properties, through: :participants
  acts_as_paranoid
end
