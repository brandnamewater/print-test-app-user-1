class HomeController < ShopifyApp::AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @webhooks = ShopifyAPI::Webhook.find(:all)
    @store_products = StoreProduct.all
    @orders = Order.all
    @shops = Shop.all
    @fulfillment = ShopifyAPI::Fulfillment.new

  end
end
