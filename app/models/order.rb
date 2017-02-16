class Order < ActiveRecord::Base
  belongs_to :edition
  belongs_to :customer

  before_create do
    self.status = "open"
  end
end
