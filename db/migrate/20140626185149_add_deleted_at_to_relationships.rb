class AddDeletedAtToRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :deleted_at, :datetime
    add_index :relationships, :deleted_at
    add_column :relationship_types, :deleted_at, :datetime
    add_index :relationship_types, :deleted_at
  end
end
