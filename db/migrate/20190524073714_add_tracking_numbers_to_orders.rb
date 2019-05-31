class AddTrackingNumbersToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :tracking_numbers, :string
  end
end
