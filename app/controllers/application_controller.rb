class ApplicationController < ActionController::Base
  layout "embedded_app"
   protect_from_forgery with: :exception
   include CurrentCart
   before_action :set_cart

   helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
end
