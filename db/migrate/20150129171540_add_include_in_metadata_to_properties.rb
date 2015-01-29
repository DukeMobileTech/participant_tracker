class AddIncludeInMetadataToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :include_in_metadata, :boolean, default: false
  end
end
