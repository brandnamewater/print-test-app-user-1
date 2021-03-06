class FulfillmentsController < ShopifyApp::AuthenticatedController
  # before_action :set_fulfillment, only: [:show, :edit, :update, :destroy]

  # GET /fulfillments
  # GET /fulfillments.json
  # def index
  #   @fulfillments = Fulfillment.all
  # end

  # GET /fulfillments/1
  # GET /fulfillments/1.json
  # def show
  # end

  # GET /fulfillments/new
  def new
    @orders = Order.all
    @order = Order.find_by(params[:order_id])

    # @order = Order.find_by(params[:shopify_order_id])
    # @shops = Shop.all
    ShopifyAPI::Fulfillment.new(order_number: @order.shopify_order_id,
                               location_id: @order.location_id,
                               line_items: @order.shopify_product_id,
                               tracking_numbers: @order.tracking_numbers)
  end

  # GET /fulfillments/1/edit
  def edit
  end

  # POST /fulfillments
  # POST /fulfillments.json
  def create
    # @fulfillment = Fulfillment.new(fulfillment_params)
    @orders = Order.all
    @order = Order.find_by(params[:order_id])
    # @shops = Shop.all
    ShopifyAPI::Fulfillment.new(order_number: @order.shopify_order_id,
                                               location_id: @order.location_id,
                                               line_items: @order.shopify_product_id,
                                               tracking_numbers: @order.tracking_numbers)

    respond_to do |format|
      if @fulfillment.save
        format.html { redirect_to @fulfillment, notice: 'Fulfillment was successfully created.' }
        format.json { render :show, status: :created, location: @fulfillment }
      else
        format.html { render :new }
        format.json { render json: @fulfillment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fulfillments/1
  # PATCH/PUT /fulfillments/1.json
  def update
    respond_to do |format|
      if @fulfillment.update(fulfillment_params)
        format.html { redirect_to @fulfillment, notice: 'Fulfillment was successfully updated.' }
        format.json { render :show, status: :ok, location: @fulfillment }
      else
        format.html { render :edit }
        format.json { render json: @fulfillment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fulfillments/1
  # DELETE /fulfillments/1.json
  def destroy
    @fulfillment.destroy
    respond_to do |format|
      format.html { redirect_to fulfillments_url, notice: 'Fulfillment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fulfillment
      @fulfillment = Fulfillment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fulfillment_params
      params.fetch(:fulfillment, {}).permit(:order_number, :location_id, :line_items, :tracking_numbers)
    end
end
