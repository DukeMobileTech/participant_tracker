class MakeUseAsLabelDefaultFalse < ActiveRecord::Migration
  def change
    change_column :properties, :use_as_label, :boolean, default: false
  end
end
