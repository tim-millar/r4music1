class Customer < ActiveRecord::Base
  has_many :orders, dependent: true, order: "created_at ASC"
end
