require 'test_helper'

class Backoffice::AccountsPayablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @backoffice_accounts_payable = backoffice_accounts_payables(:one)
  end

  test "should get index" do
    get backoffice_accounts_payables_url
    assert_response :success
  end

  test "should get new" do
    get new_backoffice_accounts_payable_url
    assert_response :success
  end

  test "should create backoffice_accounts_payable" do
    assert_difference('Backoffice::AccountsPayable.count') do
      post backoffice_accounts_payables_url, params: { backoffice_accounts_payable: { additions_value: @backoffice_accounts_payable.additions_value, current_parcel: @backoffice_accounts_payable.current_parcel, description: @backoffice_accounts_payable.description, discount_value: @backoffice_accounts_payable.discount_value, document_kind: @backoffice_accounts_payable.document_kind, document_number: @backoffice_accounts_payable.document_number, expiration_date: @backoffice_accounts_payable.expiration_date, issue_date: @backoffice_accounts_payable.issue_date, paid_value: @backoffice_accounts_payable.paid_value, payable_value: @backoffice_accounts_payable.payable_value, payment_date: @backoffice_accounts_payable.payment_date, purchase_id: @backoffice_accounts_payable.purchase_id, references: @backoffice_accounts_payable.references, state: @backoffice_accounts_payable.state, system_user: @backoffice_accounts_payable.system_user, total_parcels: @backoffice_accounts_payable.total_parcels, total_value: @backoffice_accounts_payable.total_value, voucher_image: @backoffice_accounts_payable.voucher_image } }
    end

    assert_redirected_to backoffice_accounts_payable_url(Backoffice::AccountsPayable.last)
  end

  test "should show backoffice_accounts_payable" do
    get backoffice_accounts_payable_url(@backoffice_accounts_payable)
    assert_response :success
  end

  test "should get edit" do
    get edit_backoffice_accounts_payable_url(@backoffice_accounts_payable)
    assert_response :success
  end

  test "should update backoffice_accounts_payable" do
    patch backoffice_accounts_payable_url(@backoffice_accounts_payable), params: { backoffice_accounts_payable: { additions_value: @backoffice_accounts_payable.additions_value, current_parcel: @backoffice_accounts_payable.current_parcel, description: @backoffice_accounts_payable.description, discount_value: @backoffice_accounts_payable.discount_value, document_kind: @backoffice_accounts_payable.document_kind, document_number: @backoffice_accounts_payable.document_number, expiration_date: @backoffice_accounts_payable.expiration_date, issue_date: @backoffice_accounts_payable.issue_date, paid_value: @backoffice_accounts_payable.paid_value, payable_value: @backoffice_accounts_payable.payable_value, payment_date: @backoffice_accounts_payable.payment_date, purchase_id: @backoffice_accounts_payable.purchase_id, references: @backoffice_accounts_payable.references, state: @backoffice_accounts_payable.state, system_user: @backoffice_accounts_payable.system_user, total_parcels: @backoffice_accounts_payable.total_parcels, total_value: @backoffice_accounts_payable.total_value, voucher_image: @backoffice_accounts_payable.voucher_image } }
    assert_redirected_to backoffice_accounts_payable_url(@backoffice_accounts_payable)
  end

  test "should destroy backoffice_accounts_payable" do
    assert_difference('Backoffice::AccountsPayable.count', -1) do
      delete backoffice_accounts_payable_url(@backoffice_accounts_payable)
    end

    assert_redirected_to backoffice_accounts_payables_url
  end
end
