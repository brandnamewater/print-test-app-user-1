class AddShopifyOrderInfoToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :shopify_store_order_id, :string
  end
end
