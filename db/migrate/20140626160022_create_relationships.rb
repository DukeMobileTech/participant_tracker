class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :relationship_type_id
      t.string :participant_owner_uuid
      t.string :uuid
      t.string :participant_related_uuid

      t.timestamps
    end
  end
end
