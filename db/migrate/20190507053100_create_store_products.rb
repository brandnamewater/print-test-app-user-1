class CreateStoreProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :store_products do |t|

      t.timestamps
    end
  end
end
