class HomeController < ShopifyApp::AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @webhooks = ShopifyAPI::Webhook.find(:all)

    # new_product = ShopifyAPI::Product.new
    # new_product.title = "Burton Custom Freestlye 151"
    # new_product.product_type = "Snowboard"
    # new_product.vendor = "Burton"
    # new_product.save

    # @new_product = "https://#{@shop_session.url}/admin/api/products.json"

  @store_products = StoreProduct.all

  @orders = Order.all
  @shops = Shop.all
  @fulfillment = ShopifyAPI::Fulfillment.new

  end
end
