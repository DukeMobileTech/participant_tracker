class AddActiveToParticipant < ActiveRecord::Migration
  def change
    add_column :participants, :active, :boolean, default: false
    add_column :participants, :validator_value, :string, default: ''
  end
end
