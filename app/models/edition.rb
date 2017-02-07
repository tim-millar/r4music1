class Edition < ActiveRecord::Base
  belongs_to :work
  belongs_to :publisher

  before_create do
    self.description = "standard" unless description
  end
end
