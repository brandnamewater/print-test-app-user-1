class OrdersController < ShopifyApp::AuthenticatedController
  include CurrentCart
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
    # @store_products = StoreProduct.all

    # @store_orders = ShopifyAPI::Order.find(params: {:line_items[:id] => @store_products.each {|store_product| store_product.store_product_id} })
    @store_product_ids = StoreProduct.pluck(:store_product_id)
    @store_products_ = StoreProduct.all

    @store_orders = ShopifyAPI::Order.all
    # @store_products = ShopifyAPI::Order.where(:line_items => { :product_id => @store_product_ids } )
    @store_products = ShopifyAPI::Order.find(:all)



    # @store_products = store_products.find(:params => { :line_items => { :pr3oduct_id => @store_product_ids } } )

    # @match_store_orders = @store_orders.line_item.where(id: @store_products.each {|store_product| store_product.store_product_id})
    # @match_store_orders = @store_orders.find { |order| order.line_items[0]product_id == (@store_products.each {|store_product| store_product.store_product_id}) }
    # @match_store_orders = @store_orders.each do |order|
    # @match_store_orders = @store_orders.where(line_items.product_id == (@store_products.each {|store_product| store_product.store_product_id})
    # @match_store_orders = @store_orders.where("line_items --> 'product_id' == '@store_products.each {|store_product| store_product.store_product_id}' ")

    # @match_store_orders = @store_orders.each { |order| order.line_items.each { |line_item| line_item.where(product_id == @store_products.each {|store_product| store_product.store_product_id} ) } }
    # @match_store_orders = @store_orders.each do |order|
    #                         order.line_items.each do |line|
    #                           @match_orders = line.where(line.product_id == @store_products.each {|store_product| store_product.store_product_id})
    #                           # line.product_id
    #                         end
    #                       end


    # @store_orders.map do |order|
    #   @line_items = order.line_items
    #   @line_items_ids = line_items.map { |li| li.product_id}
    #
    #   @common_ids = @store_product_ids && @line_items_ids
    #
    #
    # end

    # @line_items = @store_orders.each do |order|
      # line_items = order.line_items
      # @line_items_ids = line_items.collect { |li| li.product_id}

    # end

    # @store_orders.each do |order|
    #   order.line_items.each do |line|
    #     @line_products = line
    #   end
    # end

    line_items = @store_orders.map { |order| order.line_items }.flatten
    line_items_ids = line_items.map { |li| li.product_id}
    @common_ids = @store_product_ids && line_items_ids

    @products_ = StoreProduct.where(store_product_id: @common_ids)


    # line_items = @store_orders.map { |order| order.line_items}.flatten
    # line_items.first



  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @store_products = StoreProduct.all
    @products = Product.all
    @cart = Cart.find(params[:cart_id])


  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @cart = Cart.find(@order.cart_id)

    # @store_products = StoreProduct.all
    # @products = Product.all
    #
    # @store_product = StoreProduct.find(params[:store_product_id])
    # @product = Product.find(params[:product_id])
    #
    # @order.product_id = @product.id
    # @order.store_product_id = @store_product.id

    @order.store_product_id = @cart.line_items { |item| item.store_product.store_product_id}

    # respond_to do |format|
      if @order.save

        session[:cart_id] = nil

        # @cart.destroy
        # format.html { redirect_to @order, notice: 'Order was successfully created.' }
        # format.json { render :show, status: :created, location: @order }
        redirect_to '/'
        flash[:notice] = "Order was successfully created."

      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      # end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    @order = Order.find(params[:id])
    # shop = ShopifyAPI::Shop.current

    # f = ShopifyAPI::Fulfillment.new({order_id: @order.shopify_order_id,
    #                            location_id: @order.location_id,
    #                            line_items: @order.shopify_product_id,
    #                            tracking_number: @order.tracking_numbers})
    # f.prefix_options = { :order_id => @order.shopify_order_id }
    # f.save!
    # respond_to do |format|
      if @order.update(order_params)
        # ShopifyAPI::Fulfillment.new({order_number: @order.shopify_order_id,
        #                            location_id: @order.location_id,
        #                            line_items: @order.shopify_product_id,
        #                            tracking_numbers: @order.tracking_numbers})
        f = ShopifyAPI::Fulfillment.new(
                                        :location_id =>  "#{@order.location_id}",
                                        :line_item => "#{@order.shopify_product_id}",
                                        :tracking_number => "#{@order.tracking_numbers}",
                                        :tracking_company => "USPS",)
        f.prefix_options = { :order_id => "#{@order.shopify_order_id}" }
        f.save!
        # format.html { redirect_to '/', notice: 'Order was successfully updated.' }
        # format.json { render :show, status: :ok, location: @order }
      else
        # format.html { render :edit }
        # format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    # end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.fetch(:order, {}).permit(:type, :shopify_order_id, :shopify_product_id, :tracking_numbers, :tracking_number, :location_id, :store_product_id, :product_id, :cart_id)
    end
end
