class RemoveWorkFromEditions < ActiveRecord::Migration
  def change
    remove_reference :editions, :work, index: true, foreign_key: true
  end
end
