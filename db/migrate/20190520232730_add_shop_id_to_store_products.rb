class AddShopIdToStoreProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :store_products, :shop_id, :integer
  end
end
