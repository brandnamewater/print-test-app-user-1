# class ProductsController < ApplicationController
class ProductsController < ShopifyApp::AuthenticatedController
  # before_action :set_product, only: [:show, :edit, :update, :destroy]


  # def new
  #   @product = Product.new
  # end
  #
  #
  # def create
  #   # shop = ShopifyAPI::Shop.current
  #
  #   # @product = ShopifyAPI::Product.new(
  #   #   :title => product_params[:title],
  #   #   :product_type => product_params[:product_type],
  #   #   :vendor => product_params[:vendor],
  #   # )
  #   # if @product.save
  #   #   # success! probably redirect_to some page that lists the user's products
  #   #   redirect_to '/'
  #   #   flash[:notice] = "saved"
  #   # else
  #   #   flash[:error] = 'Unable to create product'
  #   #   render :new
  #   # end
  #   @product = Product.new(product_params)
  #
  # end
  #
  # private
  # def product_params
  #   params.require(:product).permit(:title, :product_type, :vendor)
  # end


def index
  @products = Product.all
end

# GET /products/1
# GET /products/1.json
def show
end

# GET /products/new
def new
  @product = Product.new
  @styles = Style.all
  @categories = Category.all
end

# GET /products/1/edit
def edit
  @styles = Style.all

  @categories = Category.all

end

# POST /products
# POST /products.json
def create
  @styles = Style.all
  @categories = Category.all

  @product = Product.new(product_params)
  @style = Style.find_by(params[:style_id])
  @category = Category.find_by(params[:category_id])

  @product.style_id = @style.id
  @product.category_id = @category.id



  respond_to do |format|
    if @product.save
      format.html { redirect_to @product, notice: 'Product was successfully created.' }
      format.json { render :show, status: :created, location: @product }
    else
      format.html { render :new }
      format.json { render json: @product.errors, status: :unprocessable_entity }
    end
  end
end

# PATCH/PUT /products/1
# PATCH/PUT /products/1.json
def update
  respond_to do |format|
    if @product.update(product_params)
      format.html { redirect_to @product, notice: 'Product was successfully updated.' }
      format.json { render :show, status: :ok, location: @product }
    else
      format.html { render :edit }
      format.json { render json: @product.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE /products/1
# DELETE /products/1.json
def destroy
  @product.destroy
  respond_to do |format|
    format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
    format.json { head :no_content }
  end
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:attr1, :sku, :country, :color, :price, :price_embroidery, :size, :style, :category, :style_id, :category_id, {style_ids: []}, {category_ids: []})
  end
end
