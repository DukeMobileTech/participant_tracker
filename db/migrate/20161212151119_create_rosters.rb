class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.string :uuid
      t.string :identifier
      t.string :instrument_title
      t.integer :instrument_id
      t.integer :instrument_version_number
      t.timestamps
    end
    create_table :surveys do |t|
      t.integer :instrument_id
      t.integer :instrument_version_number
      t.string :device_uuid
      t.string :device_label
      t.string :uuid
      t.string :instrument_title
      t.string :latitude
      t.string :longitude
      t.text :metadata
      t.boolean :has_critical_responses
      t.string :roster_uuid
      t.timestamps
    end
    create_table :responses do |t|
      t.string :survey_uuid
      t.integer :question_id
      t.text :text
      t.text :other_response
      t.string :special_response
      t.datetime :time_started
      t.datetime :time_ended
      t.string :question_identifier
      t.string :uuid
      t.integer :question_version
      t.integer :device_user_id
      t.timestamps
    end
  end
end