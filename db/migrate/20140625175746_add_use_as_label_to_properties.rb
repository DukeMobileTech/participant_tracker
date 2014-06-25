class AddUseAsLabelToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :use_as_label, :boolean
  end
end
