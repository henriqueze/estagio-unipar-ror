require 'test_helper'

class Backoffice::PurchasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @backoffice_purchase = backoffice_purchases(:one)
  end

  test "should get index" do
    get backoffice_purchases_url
    assert_response :success
  end

  test "should get new" do
    get new_backoffice_purchase_url
    assert_response :success
  end

  test "should create backoffice_purchase" do
    assert_difference('Backoffice::Purchase.count') do
      post backoffice_purchases_url, params: { backoffice_purchase: { date: @backoffice_purchase.date, freight_value: @backoffice_purchase.freight_value, person_id: @backoffice_purchase.person_id, total_value: @backoffice_purchase.total_value } }
    end

    assert_redirected_to backoffice_purchase_url(Backoffice::Purchase.last)
  end

  test "should show backoffice_purchase" do
    get backoffice_purchase_url(@backoffice_purchase)
    assert_response :success
  end

  test "should get edit" do
    get edit_backoffice_purchase_url(@backoffice_purchase)
    assert_response :success
  end

  test "should update backoffice_purchase" do
    patch backoffice_purchase_url(@backoffice_purchase), params: { backoffice_purchase: { date: @backoffice_purchase.date, freight_value: @backoffice_purchase.freight_value, person_id: @backoffice_purchase.person_id, total_value: @backoffice_purchase.total_value } }
    assert_redirected_to backoffice_purchase_url(@backoffice_purchase)
  end

  test "should destroy backoffice_purchase" do
    assert_difference('Backoffice::Purchase.count', -1) do
      delete backoffice_purchase_url(@backoffice_purchase)
    end

    assert_redirected_to backoffice_purchases_url
  end
end
