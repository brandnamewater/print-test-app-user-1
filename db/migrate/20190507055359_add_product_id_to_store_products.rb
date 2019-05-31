class AddProductIdToStoreProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :store_products, :product_id, :integer
    add_column :store_products, :store_product_id, :string
  end
end
