class LineItem < ApplicationRecord
  belongs_to :store_product
  belongs_to :cart
  # belongs_to :order

  def total_price
    store_product.price.to_i * quantity.to_i
  end
end
