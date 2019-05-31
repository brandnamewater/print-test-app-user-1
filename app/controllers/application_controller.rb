class ApplicationController < ActionController::Base
  layout "embedded_app"
   protect_from_forgery with: :exception
   include CurrentCart
   before_action :set_cart
end
