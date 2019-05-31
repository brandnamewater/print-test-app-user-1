module CurrentCart

  private

    def set_cart
      @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end

    # def check_orders
    #   @cart = Cart.find(session[:cart_id])
    #   if @cart.id == Order.where(cart_id: @cart.id)
    #     @cart = Cart.create
    #     session[:cart_id] = @cart.id
    #   end
    # end

end
