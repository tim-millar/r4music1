class Composer < ActiveRecord::Base
  has_many :works

  def self.sales_rankings
    Hash.new(0).tap do |rankings|
      Work.sales_rankings.map do |work,sales|
        rankings[work.composer.id] += sales
      end
    end
  end

  def editions
    works.map { |work| work.editions }.flatten.uniq
  end

  def whole_name
    first_name + ' ' + optional_middle_name + ' ' + last_name
  end

  def editions
    works.flat_map { |work| work.editions }.uniq
  end

  def publishers
    editions.map { |edition| edition.publisher }.uniq
  end

  private

  def optional_middle_name
    if middle_name?
      middle_name
    else
      ''
    end
  end
end
