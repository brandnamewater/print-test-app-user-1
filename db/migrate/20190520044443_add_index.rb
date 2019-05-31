class AddIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :orders, :shopify_order_id, unique: false
  end
end
