class CreateEditions < ActiveRecord::Migration
  def change
    create_table :editions do |t|
      t.string :description
      t.string :publisher
      t.integer :year
      t.float :price
      t.references :work, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
