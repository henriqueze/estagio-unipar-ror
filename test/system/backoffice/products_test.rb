require "application_system_test_case"

class Backoffice::ProductsTest < ApplicationSystemTestCase
  setup do
    @backoffice_product = backoffice_products(:one)
  end

  test "visiting the index" do
    visit backoffice_products_url
    assert_selector "h1", text: "Backoffice/Products"
  end

  test "creating a Product" do
    visit backoffice_products_url
    click_on "New Backoffice/Product"

    fill_in "Category", with: @backoffice_product.category_id
    fill_in "Description", with: @backoffice_product.description
    fill_in "Product Code", with: @backoffice_product.product_code
    fill_in "Profit Margin", with: @backoffice_product.profit_margin
    fill_in "Purchase Price", with: @backoffice_product.purchase_price
    fill_in "Sale Price", with: @backoffice_product.sale_price
    fill_in "Stock", with: @backoffice_product.stock
    fill_in "Stock Reserved", with: @backoffice_product.stock_reserved
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    visit backoffice_products_url
    click_on "Edit", match: :first

    fill_in "Category", with: @backoffice_product.category_id
    fill_in "Description", with: @backoffice_product.description
    fill_in "Product Code", with: @backoffice_product.product_code
    fill_in "Profit Margin", with: @backoffice_product.profit_margin
    fill_in "Purchase Price", with: @backoffice_product.purchase_price
    fill_in "Sale Price", with: @backoffice_product.sale_price
    fill_in "Stock", with: @backoffice_product.stock
    fill_in "Stock Reserved", with: @backoffice_product.stock_reserved
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "destroying a Product" do
    visit backoffice_products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end
