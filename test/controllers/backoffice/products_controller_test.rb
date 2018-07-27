require 'test_helper'

class Backoffice::ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @backoffice_product = backoffice_products(:one)
  end

  test "should get index" do
    get backoffice_products_url
    assert_response :success
  end

  test "should get new" do
    get new_backoffice_product_url
    assert_response :success
  end

  test "should create backoffice_product" do
    assert_difference('Backoffice::Product.count') do
      post backoffice_products_url, params: { backoffice_product: { category_id: @backoffice_product.category_id, description: @backoffice_product.description, product_code: @backoffice_product.product_code, profit_margin: @backoffice_product.profit_margin, purchase_price: @backoffice_product.purchase_price, sale_price: @backoffice_product.sale_price, stock: @backoffice_product.stock, stock_reserved: @backoffice_product.stock_reserved } }
    end

    assert_redirected_to backoffice_product_url(Backoffice::Product.last)
  end

  test "should show backoffice_product" do
    get backoffice_product_url(@backoffice_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_backoffice_product_url(@backoffice_product)
    assert_response :success
  end

  test "should update backoffice_product" do
    patch backoffice_product_url(@backoffice_product), params: { backoffice_product: { category_id: @backoffice_product.category_id, description: @backoffice_product.description, product_code: @backoffice_product.product_code, profit_margin: @backoffice_product.profit_margin, purchase_price: @backoffice_product.purchase_price, sale_price: @backoffice_product.sale_price, stock: @backoffice_product.stock, stock_reserved: @backoffice_product.stock_reserved } }
    assert_redirected_to backoffice_product_url(@backoffice_product)
  end

  test "should destroy backoffice_product" do
    assert_difference('Backoffice::Product.count', -1) do
      delete backoffice_product_url(@backoffice_product)
    end

    assert_redirected_to backoffice_products_url
  end
end
