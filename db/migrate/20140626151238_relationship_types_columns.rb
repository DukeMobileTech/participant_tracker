class RelationshipTypesColumns < ActiveRecord::Migration
  def change
    rename_column :relationship_types, :owner, :participant_type_owner_id
    rename_column :relationship_types, :related, :participant_type_related_id
  end
end
