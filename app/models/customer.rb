class Customer < ActiveRecord::Base
  has_many :orders,
           -> { order(created_at: :asc) },
           dependent: :destroy

  def open_orders
    orders.where(status: 'open')
  end

  def editions_on_order
    editions(open_orders)
  end

  def edition_history
    editions(orders)
  end

  def work_history
    works(edition_history)
  end

  def works_on_order
    works(editions_on_order)
  end

  def composer_rankings
    rank(comp_history)
  end

  def instrument_rankings
    rank(instr_history)
  end

  def copies_of(edition)
    orders.where(edition_id: edition.id).size
  end

  def balance
    "%.2f" % open_orders.inject(0) do |acc,order|
      acc + order.edition.price
    end
  end

  def check_out
    orders.each do |order|
      order.upadte_attribute(:status, 'paid')
    end
  end

  private

  def comp_history
    edition_history.flat_map { |edition| edition.composers }
  end

  def instr_history
    work_history.flat_map { |work| work.instruments }
  end

  def rank(list)
    list.uniq.sort_by do |i|
      list.select { |instr| instr == i }.size
    end
  end

  def editions(list)
    list.map { |order| order.edition }.uniq
  end

  def works(list)
    list.flat_map { |edition| edition.works }.uniq
  end
end
