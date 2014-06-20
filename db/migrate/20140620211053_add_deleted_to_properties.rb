class AddDeletedToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :deleted_at, :datetime
    add_index :properties, :deleted_at
    add_column :participant_properties, :deleted_at, :datetime
    add_index :participant_properties, :deleted_at
    add_column :participant_types, :deleted_at, :datetime
    add_index :participant_types, :deleted_at
    add_column :participants, :deleted_at, :datetime
    add_index :participants, :deleted_at
  end
end
