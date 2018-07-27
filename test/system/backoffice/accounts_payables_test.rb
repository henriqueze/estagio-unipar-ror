require "application_system_test_case"

class Backoffice::AccountsPayablesTest < ApplicationSystemTestCase
  setup do
    @backoffice_accounts_payable = backoffice_accounts_payables(:one)
  end

  test "visiting the index" do
    visit backoffice_accounts_payables_url
    assert_selector "h1", text: "Backoffice/Accounts Payables"
  end

  test "creating a Accounts payable" do
    visit backoffice_accounts_payables_url
    click_on "New Backoffice/Accounts Payable"

    fill_in "Additions Value", with: @backoffice_accounts_payable.additions_value
    fill_in "Current Parcel", with: @backoffice_accounts_payable.current_parcel
    fill_in "Description", with: @backoffice_accounts_payable.description
    fill_in "Discount Value", with: @backoffice_accounts_payable.discount_value
    fill_in "Document Kind", with: @backoffice_accounts_payable.document_kind
    fill_in "Document Number", with: @backoffice_accounts_payable.document_number
    fill_in "Expiration Date", with: @backoffice_accounts_payable.expiration_date
    fill_in "Issue Date", with: @backoffice_accounts_payable.issue_date
    fill_in "Paid Value", with: @backoffice_accounts_payable.paid_value
    fill_in "Payable Value", with: @backoffice_accounts_payable.payable_value
    fill_in "Payment Date", with: @backoffice_accounts_payable.payment_date
    fill_in "Purchase", with: @backoffice_accounts_payable.purchase_id
    fill_in "References", with: @backoffice_accounts_payable.references
    fill_in "State", with: @backoffice_accounts_payable.state
    fill_in "System User", with: @backoffice_accounts_payable.system_user
    fill_in "Total Parcels", with: @backoffice_accounts_payable.total_parcels
    fill_in "Total Value", with: @backoffice_accounts_payable.total_value
    fill_in "Voucher Image", with: @backoffice_accounts_payable.voucher_image
    click_on "Create Accounts payable"

    assert_text "Accounts payable was successfully created"
    click_on "Back"
  end

  test "updating a Accounts payable" do
    visit backoffice_accounts_payables_url
    click_on "Edit", match: :first

    fill_in "Additions Value", with: @backoffice_accounts_payable.additions_value
    fill_in "Current Parcel", with: @backoffice_accounts_payable.current_parcel
    fill_in "Description", with: @backoffice_accounts_payable.description
    fill_in "Discount Value", with: @backoffice_accounts_payable.discount_value
    fill_in "Document Kind", with: @backoffice_accounts_payable.document_kind
    fill_in "Document Number", with: @backoffice_accounts_payable.document_number
    fill_in "Expiration Date", with: @backoffice_accounts_payable.expiration_date
    fill_in "Issue Date", with: @backoffice_accounts_payable.issue_date
    fill_in "Paid Value", with: @backoffice_accounts_payable.paid_value
    fill_in "Payable Value", with: @backoffice_accounts_payable.payable_value
    fill_in "Payment Date", with: @backoffice_accounts_payable.payment_date
    fill_in "Purchase", with: @backoffice_accounts_payable.purchase_id
    fill_in "References", with: @backoffice_accounts_payable.references
    fill_in "State", with: @backoffice_accounts_payable.state
    fill_in "System User", with: @backoffice_accounts_payable.system_user
    fill_in "Total Parcels", with: @backoffice_accounts_payable.total_parcels
    fill_in "Total Value", with: @backoffice_accounts_payable.total_value
    fill_in "Voucher Image", with: @backoffice_accounts_payable.voucher_image
    click_on "Update Accounts payable"

    assert_text "Accounts payable was successfully updated"
    click_on "Back"
  end

  test "destroying a Accounts payable" do
    visit backoffice_accounts_payables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Accounts payable was successfully destroyed"
  end
end
