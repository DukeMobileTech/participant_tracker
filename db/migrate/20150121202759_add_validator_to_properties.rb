class AddValidatorToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :validator, :string, default: ""
  end
end
