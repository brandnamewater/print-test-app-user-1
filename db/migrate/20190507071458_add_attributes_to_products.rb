class AddAttributesToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :sku, :string
    add_column :products, :country, :string
    add_column :products, :color, :string
    add_column :products, :size, :string
    add_column :products, :style_id, :integer
    add_column :products, :price, :string
    add_column :products, :category_id, :integer
  end
end
