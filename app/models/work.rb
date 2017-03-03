class Work < ActiveRecord::Base

  ORDERED = %w{ flute oboe violin viola cello piano orchestra }
  PERIODS = {
    [1650..1750, %w{ EN DE FR IT ES NL }] => 'Baroque',
    [1751..1810, %w{ EN IT DE NL }] => 'Classical',
    [1751..1830, %w{ FR }] => 'Classical',
    [1837..1901, %w{ EN }] => 'Victorian',
    [1820..1897, %w{ DE FR }] => 'Romantic',
  }

  belongs_to :composer
  has_and_belongs_to_many :editions, order: 'year ASC'
  has_and_belongs_to_many :instruments, order: 'year ASC'

  def self.all_periods
    all.flat_map { |work| work.period }.uniq.sort
  end

  def self.sales_rankings
    Hash.new(0).tap do |rankings|
      all.each do |work|
        work.editions.each do |edition|
          rankings[work.id] += edition.orders.size
        end
      end
    end
  end

  def publishers
    editions.map { |edition| edition.publisher }.uniq
  end

  def country
    composer.country
  end

  def ordered_by
    orders.map { |order| order.customers }.uniq
  end

  def key
    kee
  end

  def nice_title
    "#{title} #{key_str}#{nice_opus_str}#{nice_instr_str}"
  end

  def nice_instruments
    case sorted_instrs.size
    when 0
      nil
    when 1
      sorted_instrs.first
    when 2
      sorted_instrs.join(' and ')
    else
      sorted_instrs[0..-2].join(', ') + ', and ' + sorted_instrs.last
    end
  end

  def nice_opus
    if /^\d/.match(opus)
      "op. #{opus}"
    else
      opus
    end
  end

  def period
    PERIODS[pkey] || century
  end

  def century
    cent + ordinal_indicator + ' century'
  end

  private

  def orders
    editions.flat_map { |edition| edition.orders }
  end

  def sorted_instrs
    unsorted_instrs.sort_by { |i| ORDERED.index(i) || 0 }
  end

  def unsorted_instrs
    instruments.map { |inst| inst.name }
  end

  def pkey
    PERIODS.keys.find do |yrange,countries|
      yrange.include?(year) && countries.include?(country)
    end
  end

  def key_str
    if key?
      "in #{key}"
    end
  end

  def nice_opus_str
    if nice_opus
      ", #{nice_opus}"
    end
  end

  def nice_instr_str
    if nice_instruments
      ", for #{nice_instruments}"
    end
  end

  def ordinal_indicator
    case cent
    when '21' then 'st'
    else 'th'
    end
  end

  def cent
    (year - 1).to_s[0,2].succ
  end
end
