class HomeController < ShopifyApp::AuthenticatedController
  helper_method :current_user

 def current_user
   if session[:user_id]
     @current_user ||= User.find(session[:user_id])
   else
     @current_user = nil
   end
 end
 
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @webhooks = ShopifyAPI::Webhook.find(:all)
    @store_products = StoreProduct.all
    @orders = Order.all
    @shops = Shop.all
    @fulfillment = ShopifyAPI::Fulfillment.new

  end
end
