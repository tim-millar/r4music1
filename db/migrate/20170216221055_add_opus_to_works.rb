class AddOpusToWorks < ActiveRecord::Migration
  def change
    add_column :works, :opus, :string
  end
end
