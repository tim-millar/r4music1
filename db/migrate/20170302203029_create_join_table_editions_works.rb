class CreateJoinTableEditionsWorks < ActiveRecord::Migration
  def change
    create_join_table :editions, :works do |t|
      t.index [:edition_id, :work_id]
      t.index [:work_id, :edition_id]
    end
  end
end
