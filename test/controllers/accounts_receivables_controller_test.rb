require 'test_helper'

class AccountsReceivablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @accounts_receivable = accounts_receivables(:one)
  end

  test "should get index" do
    get accounts_receivables_url
    assert_response :success
  end

  test "should get new" do
    get new_accounts_receivable_url
    assert_response :success
  end

  test "should create accounts_receivable" do
    assert_difference('AccountsReceivable.count') do
      post accounts_receivables_url, params: { accounts_receivable: { description: @accounts_receivable.description, expiration_date: @accounts_receivable.expiration_date, issue_date: @accounts_receivable.issue_date, kind: @accounts_receivable.kind, parcel: @accounts_receivable.parcel, payment_type_id: @accounts_receivable.payment_type_id, received_date: @accounts_receivable.received_date, received_value: @accounts_receivable.received_value, remaining_value: @accounts_receivable.remaining_value, sales_id: @accounts_receivable.sales_id, state: @accounts_receivable.state, system_user_id: @accounts_receivable.system_user_id, total_parcels: @accounts_receivable.total_parcels, total_value: @accounts_receivable.total_value } }
    end

    assert_redirected_to accounts_receivable_url(AccountsReceivable.last)
  end

  test "should show accounts_receivable" do
    get accounts_receivable_url(@accounts_receivable)
    assert_response :success
  end

  test "should get edit" do
    get edit_accounts_receivable_url(@accounts_receivable)
    assert_response :success
  end

  test "should update accounts_receivable" do
    patch accounts_receivable_url(@accounts_receivable), params: { accounts_receivable: { description: @accounts_receivable.description, expiration_date: @accounts_receivable.expiration_date, issue_date: @accounts_receivable.issue_date, kind: @accounts_receivable.kind, parcel: @accounts_receivable.parcel, payment_type_id: @accounts_receivable.payment_type_id, received_date: @accounts_receivable.received_date, received_value: @accounts_receivable.received_value, remaining_value: @accounts_receivable.remaining_value, sales_id: @accounts_receivable.sales_id, state: @accounts_receivable.state, system_user_id: @accounts_receivable.system_user_id, total_parcels: @accounts_receivable.total_parcels, total_value: @accounts_receivable.total_value } }
    assert_redirected_to accounts_receivable_url(@accounts_receivable)
  end

  test "should destroy accounts_receivable" do
    assert_difference('AccountsReceivable.count', -1) do
      delete accounts_receivable_url(@accounts_receivable)
    end

    assert_redirected_to accounts_receivables_url
  end
end
