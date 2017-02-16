class AddKeeToWorks < ActiveRecord::Migration
  def change
    add_column :works, :kee, :string
  end
end
