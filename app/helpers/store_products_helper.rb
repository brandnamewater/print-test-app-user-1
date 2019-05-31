module StoreProductsHelper
  def store_product_author(store_product)
    user_signed_in? && current_user.id == store_product.user_id
  end
end
