require 'test_helper'

class AccountsPayablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @accounts_payable = accounts_payables(:one)
  end

  test "should get index" do
    get accounts_payables_url
    assert_response :success
  end

  test "should get new" do
    get new_accounts_payable_url
    assert_response :success
  end

  test "should create accounts_payable" do
    assert_difference('AccountsPayable.count') do
      post accounts_payables_url, params: { accounts_payable: { additions_value: @accounts_payable.additions_value, current_parcel: @accounts_payable.current_parcel, description: @accounts_payable.description, discount_value: @accounts_payable.discount_value, document_kind: @accounts_payable.document_kind, document_number: @accounts_payable.document_number, expiration_date: @accounts_payable.expiration_date, issue_date: @accounts_payable.issue_date, paid_value: @accounts_payable.paid_value, payable_value: @accounts_payable.payable_value, payment_date: @accounts_payable.payment_date, purchase_id: @accounts_payable.purchase_id, state: @accounts_payable.state, system_user_id: @accounts_payable.system_user_id, total_parcels: @accounts_payable.total_parcels, total_value: @accounts_payable.total_value, voucher_image: @accounts_payable.voucher_image } }
    end

    assert_redirected_to accounts_payable_url(AccountsPayable.last)
  end

  test "should show accounts_payable" do
    get accounts_payable_url(@accounts_payable)
    assert_response :success
  end

  test "should get edit" do
    get edit_accounts_payable_url(@accounts_payable)
    assert_response :success
  end

  test "should update accounts_payable" do
    patch accounts_payable_url(@accounts_payable), params: { accounts_payable: { additions_value: @accounts_payable.additions_value, current_parcel: @accounts_payable.current_parcel, description: @accounts_payable.description, discount_value: @accounts_payable.discount_value, document_kind: @accounts_payable.document_kind, document_number: @accounts_payable.document_number, expiration_date: @accounts_payable.expiration_date, issue_date: @accounts_payable.issue_date, paid_value: @accounts_payable.paid_value, payable_value: @accounts_payable.payable_value, payment_date: @accounts_payable.payment_date, purchase_id: @accounts_payable.purchase_id, state: @accounts_payable.state, system_user_id: @accounts_payable.system_user_id, total_parcels: @accounts_payable.total_parcels, total_value: @accounts_payable.total_value, voucher_image: @accounts_payable.voucher_image } }
    assert_redirected_to accounts_payable_url(@accounts_payable)
  end

  test "should destroy accounts_payable" do
    assert_difference('AccountsPayable.count', -1) do
      delete accounts_payable_url(@accounts_payable)
    end

    assert_redirected_to accounts_payables_url
  end
end
