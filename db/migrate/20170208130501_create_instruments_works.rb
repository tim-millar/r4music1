class CreateInstrumentsWorks < ActiveRecord::Migration
  def change
    create_table :instruments_works, id: false do |t|
      t.belongs_to :instrument, index: true
      t.belongs_to :work, index: true
    end
  end
end
