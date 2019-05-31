module ShopifyApp
  class AuthenticatedController < ActionController::Base
    include ShopifyApp::Localization
    include ShopifyApp::LoginProtection
    include ShopifyApp::EmbeddedApp

    protect_from_forgery with: :exception
    before_action :login_again_if_different_shop
    around_action :shopify_session

    helper_method :current_user

   def current_user
     if session[:user_id]
       @current_user ||= User.find(session[:user_id])
     else
       @current_user = nil
     end
   end
  end
end
