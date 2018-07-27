require 'test_helper'

class Backoffice::AccountsReceivablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @backoffice_accounts_receivable = backoffice_accounts_receivables(:one)
  end

  test "should get index" do
    get backoffice_accounts_receivables_url
    assert_response :success
  end

  test "should get new" do
    get new_backoffice_accounts_receivable_url
    assert_response :success
  end

  test "should create backoffice_accounts_receivable" do
    assert_difference('Backoffice::AccountsReceivable.count') do
      post backoffice_accounts_receivables_url, params: { backoffice_accounts_receivable: { description: @backoffice_accounts_receivable.description, expiration_date: @backoffice_accounts_receivable.expiration_date, issue_date: @backoffice_accounts_receivable.issue_date, kind: @backoffice_accounts_receivable.kind, parcel: @backoffice_accounts_receivable.parcel, payment_type_id: @backoffice_accounts_receivable.payment_type_id, received_date: @backoffice_accounts_receivable.received_date, received_value: @backoffice_accounts_receivable.received_value, remaining_value: @backoffice_accounts_receivable.remaining_value, sales_id: @backoffice_accounts_receivable.sales_id, state: @backoffice_accounts_receivable.state, system_user_id: @backoffice_accounts_receivable.system_user_id, total_parcels: @backoffice_accounts_receivable.total_parcels, total_value: @backoffice_accounts_receivable.total_value } }
    end

    assert_redirected_to backoffice_accounts_receivable_url(Backoffice::AccountsReceivable.last)
  end

  test "should show backoffice_accounts_receivable" do
    get backoffice_accounts_receivable_url(@backoffice_accounts_receivable)
    assert_response :success
  end

  test "should get edit" do
    get edit_backoffice_accounts_receivable_url(@backoffice_accounts_receivable)
    assert_response :success
  end

  test "should update backoffice_accounts_receivable" do
    patch backoffice_accounts_receivable_url(@backoffice_accounts_receivable), params: { backoffice_accounts_receivable: { description: @backoffice_accounts_receivable.description, expiration_date: @backoffice_accounts_receivable.expiration_date, issue_date: @backoffice_accounts_receivable.issue_date, kind: @backoffice_accounts_receivable.kind, parcel: @backoffice_accounts_receivable.parcel, payment_type_id: @backoffice_accounts_receivable.payment_type_id, received_date: @backoffice_accounts_receivable.received_date, received_value: @backoffice_accounts_receivable.received_value, remaining_value: @backoffice_accounts_receivable.remaining_value, sales_id: @backoffice_accounts_receivable.sales_id, state: @backoffice_accounts_receivable.state, system_user_id: @backoffice_accounts_receivable.system_user_id, total_parcels: @backoffice_accounts_receivable.total_parcels, total_value: @backoffice_accounts_receivable.total_value } }
    assert_redirected_to backoffice_accounts_receivable_url(@backoffice_accounts_receivable)
  end

  test "should destroy backoffice_accounts_receivable" do
    assert_difference('Backoffice::AccountsReceivable.count', -1) do
      delete backoffice_accounts_receivable_url(@backoffice_accounts_receivable)
    end

    assert_redirected_to backoffice_accounts_receivables_url
  end
end
