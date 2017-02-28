class Customer < ActiveRecord::Base
  has_many :orders,
           -> { order(created_at: :asc) },
           dependent: :destroy

  def open_orders
    orders.find(:all, conditions: "status = 'open'")
  end

  def editions_on_order
    open_orders.map { |order| order.edition }.uniq
  end

  def edition_history
    orders.map { |order| order.edition }.uniq
  end

  def works_on_order
    editions_on_order.flat_map { |edition| edition.works }.uniq
  end
end
