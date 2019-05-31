class RemoveIndex < ActiveRecord::Migration[5.2]
  def change
    remove_index :orders, :shopify_order_id
  end
end
