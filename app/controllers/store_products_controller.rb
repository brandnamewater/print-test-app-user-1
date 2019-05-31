# class StoreProductsController < ApplicationController
class StoreProductsController < ShopifyApp::AuthenticatedController

  before_action :set_store_product, only: [:show, :edit, :update, :destroy]

  # GET /store_products
  # GET /store_products.json
  def index
    @store_products = StoreProduct.all
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
  end

  # GET /store_products/1
  # GET /store_products/1.json
  def show
  end

  # GET /store_products/new
  def new
    shop = ShopifyAPI::Shop.current

    @in_store_products = ShopifyAPI::Product.find(:all, params: { limit: 10 })

    @store_product = StoreProduct.new
    @products = Product.all

    @store_products = StoreProduct.all

  end

  # GET /store_products/1/edit
  def edit
  end

  # POST /store_products
  # POST /store_products.json
  def create
    @products = Product.all
    # @shop = Shop.find_by(shopify_domain: shop_domain)
    # @shop = Shop.find_or_initialize_by(shopify_domain: session.url)


    shop = ShopifyAPI::Shop.current

    @in_store_products = ShopifyAPI::Product.find(:all, params: { limit: 10 })

    @store_product = StoreProduct.new(store_product_params)
    #
    # respond_to do |format|
    #   if @store_product.save
    #     format.html { redirect_to @store_product, notice: 'Store product was successfully created.' }
    #     format.json { render :show, status: :created, location: @store_product }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @store_product.errors, status: :unprocessable_entity }
    #   end
    # end

    # @product = Product.find_by(
    #   style: @user_product.style_id,
    #   size:     @user_product.size,
    #   color:    @user_product.color,
    #   country:  @user_product.country
    # )
    @product = Product.find_by(params[:product_id])
    # @product = Product.find_by(params[:product_id])


    # @store_product = ShopifyAPI::Product.new(
    #   :title => product_params[:title],
    #   :product_type => product_params[:product_type],
    #   :vendor => product_params[:vendor],
    # )

    # @in_store_product = ShopifyAPI::Product.find(:store_product_id)

    @store_product.product_id = @product.id
    # @store_product.store_product_id = @in_store_product.id
    @store_product.shop_id = 1

    if StoreProduct.where(store_product_id: @store_product.store_product_id).present?
      redirect_to '/'
      flash[:notice] = "already exists, product already attached"
    end

    if @store_product.save
      # success! probably redirect_to some page that lists the user's products
      redirect_to '/'
      flash[:notice] = "saved"
    else
      flash[:error] = 'Unable to create product'
      render :new
    end
  end

  # PATCH/PUT /store_products/1
  # PATCH/PUT /store_products/1.json
  def update
    respond_to do |format|
      if @store_product.update(store_product_params)
        format.html { redirect_to @store_product, notice: 'Store product was successfully updated.' }
        format.json { render :show, status: :ok, location: @store_product }
      else
        format.html { render :edit }
        format.json { render json: @store_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_products/1
  # DELETE /store_products/1.json
  def destroy
    # @store_product.find(params[:id])
    @store_product.destroy
    respond_to do |format|
      format.html { redirect_to '/', notice: 'Store product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_product
      @store_product = StoreProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_product_params
      params.require(:store_product).permit(:id, :product_id, :store_product_id)
    end
end
