class AddYearToWorks < ActiveRecord::Migration
  def change
    add_column :works, :year, :integer
  end
end
