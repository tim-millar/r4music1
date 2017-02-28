class AddBirthYearToComposers < ActiveRecord::Migration
  def change
    add_column :composers, :birth_year, :date
  end
end
