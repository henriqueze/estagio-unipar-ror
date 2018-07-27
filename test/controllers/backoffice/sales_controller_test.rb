require 'test_helper'

class Backoffice::SalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @backoffice_sale = backoffice_sales(:one)
  end

  test "should get index" do
    get backoffice_sales_url
    assert_response :success
  end

  test "should get new" do
    get new_backoffice_sale_url
    assert_response :success
  end

  test "should create backoffice_sale" do
    assert_difference('Backoffice::Sale.count') do
      post backoffice_sales_url, params: { backoffice_sale: { date: @backoffice_sale.date, discount_value: @backoffice_sale.discount_value, person_id: @backoffice_sale.person_id, state: @backoffice_sale.state, total_value: @backoffice_sale.total_value } }
    end

    assert_redirected_to backoffice_sale_url(Backoffice::Sale.last)
  end

  test "should show backoffice_sale" do
    get backoffice_sale_url(@backoffice_sale)
    assert_response :success
  end

  test "should get edit" do
    get edit_backoffice_sale_url(@backoffice_sale)
    assert_response :success
  end

  test "should update backoffice_sale" do
    patch backoffice_sale_url(@backoffice_sale), params: { backoffice_sale: { date: @backoffice_sale.date, discount_value: @backoffice_sale.discount_value, person_id: @backoffice_sale.person_id, state: @backoffice_sale.state, total_value: @backoffice_sale.total_value } }
    assert_redirected_to backoffice_sale_url(@backoffice_sale)
  end

  test "should destroy backoffice_sale" do
    assert_difference('Backoffice::Sale.count', -1) do
      delete backoffice_sale_url(@backoffice_sale)
    end

    assert_redirected_to backoffice_sales_url
  end
end
