class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    create_table :user_projects do |t|
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end
    add_column :participants, :project_id, :integer
    add_index :participants, :project_id
    add_column :projects, :deleted_at, :datetime
    add_index :projects, :deleted_at
  end
end
