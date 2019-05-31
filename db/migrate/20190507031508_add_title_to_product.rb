class AddTitleToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :title, :string
    add_column :products, :vendor, :string
    add_column :products, :product_type, :string
  end
end
