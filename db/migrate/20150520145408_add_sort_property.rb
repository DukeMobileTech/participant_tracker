class AddSortProperty < ActiveRecord::Migration
  def change
    add_column :properties, :sorting_property, :boolean, default: false
  end
end
