class ChangeColumnInOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :line_items_product_id, :text, array: true, default: []

  end
end
