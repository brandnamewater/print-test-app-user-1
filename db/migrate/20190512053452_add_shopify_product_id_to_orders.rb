class AddShopifyProductIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :shopify_product_id, :integer, limit: 8
  end
end
