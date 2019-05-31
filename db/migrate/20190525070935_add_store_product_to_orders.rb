class AddStoreProductToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :store_product_id, :integer
  end
end
