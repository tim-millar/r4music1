class Edition < ActiveRecord::Base

  belongs_to :publisher
  has_many :orders
  has_and_belongs_to_many :works

  before_create do
    self.description = "standard" unless description
  end

  def self.of_works(works)
    works.flat_map { |work| work.editions }.uniq
  end

  def composers
    works.flat_map { |work| work.composer }.uniq
  end

  def nice_title
    title_or_works_title + " (#{publisher.name}, #{year})"
  end

  private

  def title_or_works_title
    title || works.first.nice_title
  end
end
