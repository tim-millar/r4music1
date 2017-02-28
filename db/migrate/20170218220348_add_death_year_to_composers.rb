class AddDeathYearToComposers < ActiveRecord::Migration
  def change
    add_column :composers, :death_year, :date
  end
end
