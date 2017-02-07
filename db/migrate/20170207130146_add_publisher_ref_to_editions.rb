class AddPublisherRefToEditions < ActiveRecord::Migration
  def change
    add_reference :editions, :publisher, index: true, foreign_key: true
  end
end
