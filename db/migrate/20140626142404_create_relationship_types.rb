class CreateRelationshipTypes < ActiveRecord::Migration
  def change
    create_table :relationship_types do |t|
      t.integer :owner
      t.integer :related
      t.string :label

      t.timestamps
    end
  end
end
