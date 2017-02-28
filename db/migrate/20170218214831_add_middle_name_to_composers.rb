class AddMiddleNameToComposers < ActiveRecord::Migration
  def change
    add_column :composers, :middle_name, :string
  end
end
