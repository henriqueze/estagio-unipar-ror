require 'test_helper'

class Backoffice::PaymentTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @backoffice_payment_type = backoffice_payment_types(:one)
  end

  test "should get index" do
    get backoffice_payment_types_url
    assert_response :success
  end

  test "should get new" do
    get new_backoffice_payment_type_url
    assert_response :success
  end

  test "should create backoffice_payment_type" do
    assert_difference('Backoffice::PaymentType.count') do
      post backoffice_payment_types_url, params: { backoffice_payment_type: { description: @backoffice_payment_type.description, interest_rates: @backoffice_payment_type.interest_rates, kind: @backoffice_payment_type.kind, max_parcel: @backoffice_payment_type.max_parcel } }
    end

    assert_redirected_to backoffice_payment_type_url(Backoffice::PaymentType.last)
  end

  test "should show backoffice_payment_type" do
    get backoffice_payment_type_url(@backoffice_payment_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_backoffice_payment_type_url(@backoffice_payment_type)
    assert_response :success
  end

  test "should update backoffice_payment_type" do
    patch backoffice_payment_type_url(@backoffice_payment_type), params: { backoffice_payment_type: { description: @backoffice_payment_type.description, interest_rates: @backoffice_payment_type.interest_rates, kind: @backoffice_payment_type.kind, max_parcel: @backoffice_payment_type.max_parcel } }
    assert_redirected_to backoffice_payment_type_url(@backoffice_payment_type)
  end

  test "should destroy backoffice_payment_type" do
    assert_difference('Backoffice::PaymentType.count', -1) do
      delete backoffice_payment_type_url(@backoffice_payment_type)
    end

    assert_redirected_to backoffice_payment_types_url
  end
end
