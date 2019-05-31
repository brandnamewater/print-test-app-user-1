class CreateFulfillments < ActiveRecord::Migration[5.2]
  def change
    create_table :fulfillments do |t|

      t.timestamps
    end
  end
end
