class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :edition, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true
      t.string :status

      t.timestamps null: false
    end
  end
end
