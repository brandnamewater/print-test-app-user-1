class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  # has_one :order

  def add_store_product(store_product)
    current_item = line_items.find_by(store_product_id: store_product.id)

    if current_item
      current_item.increment(:quantity)
    else
      current_item = line_items.build(store_product_id: store_product.id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
