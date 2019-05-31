require 'test_helper'

class StoreProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store_product = store_products(:one)
  end

  test "should get index" do
    get store_products_url
    assert_response :success
  end

  test "should get new" do
    get new_store_product_url
    assert_response :success
  end

  test "should create store_product" do
    assert_difference('StoreProduct.count') do
      post store_products_url, params: { store_product: {  } }
    end

    assert_redirected_to store_product_url(StoreProduct.last)
  end

  test "should show store_product" do
    get store_product_url(@store_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_store_product_url(@store_product)
    assert_response :success
  end

  test "should update store_product" do
    patch store_product_url(@store_product), params: { store_product: {  } }
    assert_redirected_to store_product_url(@store_product)
  end

  test "should destroy store_product" do
    assert_difference('StoreProduct.count', -1) do
      delete store_product_url(@store_product)
    end

    assert_redirected_to store_products_url
  end
end
