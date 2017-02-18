class Edition < ActiveRecord::Base
  belongs_to :work
  belongs_to :publisher
  has_many :orders

  before_create do
    self.description = "standard" unless description
  end
end
