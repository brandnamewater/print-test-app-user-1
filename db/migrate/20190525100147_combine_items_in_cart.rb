class CombineItemsInCart < ActiveRecord::Migration[5.2]
  def up
    Cart.all.each do |cart|
      sums = cart.line_items.group(:store_product_id).sum(:quantity)
      sums.each do |store_product_id, quantity|
        if quantity > 1
          cart.line_items.where(store_product_id: store_product_id).delete_all

          item = cart.line_items.build(store_product_id: store_product_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  def down
    #split items with a quantity of 1 or more into multiple items
    LineItem.where("quantity>1").each do |line_item|
      line_item.quantity.times do
        LineItem.create(
          cart_id: line_item.cart_id,
          store_product_id: line_item.store_product_id,
          quantity: 1
        )
      end
      # remove original line item
      line_item.destroy
    end
  end
end
