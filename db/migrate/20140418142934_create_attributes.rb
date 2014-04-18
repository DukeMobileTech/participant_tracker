class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.string :label
      t.string :type
      t.boolean :required

      t.timestamps
    end
  end
end
