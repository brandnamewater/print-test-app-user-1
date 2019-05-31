require "application_system_test_case"

class StoreProductsTest < ApplicationSystemTestCase
  setup do
    @store_product = store_products(:one)
  end

  test "visiting the index" do
    visit store_products_url
    assert_selector "h1", text: "Store Products"
  end

  test "creating a Store product" do
    visit store_products_url
    click_on "New Store Product"

    click_on "Create Store product"

    assert_text "Store product was successfully created"
    click_on "Back"
  end

  test "updating a Store product" do
    visit store_products_url
    click_on "Edit", match: :first

    click_on "Update Store product"

    assert_text "Store product was successfully updated"
    click_on "Back"
  end

  test "destroying a Store product" do
    visit store_products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Store product was successfully destroyed"
  end
end
