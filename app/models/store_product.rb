class StoreProduct < ApplicationRecord

  before_destroy :not_referenced_by_any_line_item

  belongs_to :product
  has_one :shop

  belongs_to :order

  # before_save :check_product_id
  #
  # def check_product_id
  #   begin
  #     self.store_product_id = @store_product.store_product_id
  #   end while self.class.find_by(store_product_id: store_product_id)
  # end

  has_many :line_items

  private

   def not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line items present')
      throw :abort
    end
   end

end
