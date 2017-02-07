class Edition < ActiveRecord::Base
  belongs_to :work

  before_create do
    self.description = "standard" unless description
  end
end
