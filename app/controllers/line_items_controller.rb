class LineItemsController < ShopifyApp::AuthenticatedController
  include CurrentCart
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  # before_action :check_orders, only: [:update, :show, :create]

  before_action :set_cart, only: [:create]


  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
    # @store_products = StoreProduct.all
    # @products = Product.all

  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    # @store_product = StoreProduct.find(params[:store_product_id])
    # @store_products = StoreProduct.all
    # @products = Product.all

    store_product = StoreProduct.find(params[:store_product_id])
    # @product = Product.find(params[:product_id])

    # @order.product_id = @product.id
    # @order.store_product_id = @store_product.id
    # @line_item = LineItem.new(line_item_params)
    @line_item = @cart.add_store_product(store_product)


    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart , notice: 'Line item was successfully created.' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:store_product_id, :product_id)
    end
end
