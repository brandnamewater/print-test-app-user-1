class AddOrderTypeToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :product_type, :integer
  end
end
