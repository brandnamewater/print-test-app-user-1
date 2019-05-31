class Order < ApplicationRecord
  # belongs_to :shop

  has_many :products
  has_many :store_products
  # has_many :line_items

  # belongs_to :cart

  enum product_type: { shopify: 1, manual: 2 }

end
