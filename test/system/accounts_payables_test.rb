require "application_system_test_case"

class AccountsPayablesTest < ApplicationSystemTestCase
  setup do
    @accounts_payable = accounts_payables(:one)
  end

  test "visiting the index" do
    visit accounts_payables_url
    assert_selector "h1", text: "Accounts Payables"
  end

  test "creating a Accounts payable" do
    visit accounts_payables_url
    click_on "New Accounts Payable"

    fill_in "Additions Value", with: @accounts_payable.additions_value
    fill_in "Current Parcel", with: @accounts_payable.current_parcel
    fill_in "Description", with: @accounts_payable.description
    fill_in "Discount Value", with: @accounts_payable.discount_value
    fill_in "Document Kind", with: @accounts_payable.document_kind
    fill_in "Document Number", with: @accounts_payable.document_number
    fill_in "Expiration Date", with: @accounts_payable.expiration_date
    fill_in "Issue Date", with: @accounts_payable.issue_date
    fill_in "Paid Value", with: @accounts_payable.paid_value
    fill_in "Payable Value", with: @accounts_payable.payable_value
    fill_in "Payment Date", with: @accounts_payable.payment_date
    fill_in "Purchase", with: @accounts_payable.purchase_id
    fill_in "State", with: @accounts_payable.state
    fill_in "System User", with: @accounts_payable.system_user_id
    fill_in "Total Parcels", with: @accounts_payable.total_parcels
    fill_in "Total Value", with: @accounts_payable.total_value
    fill_in "Voucher Image", with: @accounts_payable.voucher_image
    click_on "Create Accounts payable"

    assert_text "Accounts payable was successfully created"
    click_on "Back"
  end

  test "updating a Accounts payable" do
    visit accounts_payables_url
    click_on "Edit", match: :first

    fill_in "Additions Value", with: @accounts_payable.additions_value
    fill_in "Current Parcel", with: @accounts_payable.current_parcel
    fill_in "Description", with: @accounts_payable.description
    fill_in "Discount Value", with: @accounts_payable.discount_value
    fill_in "Document Kind", with: @accounts_payable.document_kind
    fill_in "Document Number", with: @accounts_payable.document_number
    fill_in "Expiration Date", with: @accounts_payable.expiration_date
    fill_in "Issue Date", with: @accounts_payable.issue_date
    fill_in "Paid Value", with: @accounts_payable.paid_value
    fill_in "Payable Value", with: @accounts_payable.payable_value
    fill_in "Payment Date", with: @accounts_payable.payment_date
    fill_in "Purchase", with: @accounts_payable.purchase_id
    fill_in "State", with: @accounts_payable.state
    fill_in "System User", with: @accounts_payable.system_user_id
    fill_in "Total Parcels", with: @accounts_payable.total_parcels
    fill_in "Total Value", with: @accounts_payable.total_value
    fill_in "Voucher Image", with: @accounts_payable.voucher_image
    click_on "Update Accounts payable"

    assert_text "Accounts payable was successfully updated"
    click_on "Back"
  end

  test "destroying a Accounts payable" do
    visit accounts_payables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Accounts payable was successfully destroyed"
  end
end
