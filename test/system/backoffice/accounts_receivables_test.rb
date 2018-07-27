require "application_system_test_case"

class Backoffice::AccountsReceivablesTest < ApplicationSystemTestCase
  setup do
    @backoffice_accounts_receivable = backoffice_accounts_receivables(:one)
  end

  test "visiting the index" do
    visit backoffice_accounts_receivables_url
    assert_selector "h1", text: "Backoffice/Accounts Receivables"
  end

  test "creating a Accounts receivable" do
    visit backoffice_accounts_receivables_url
    click_on "New Backoffice/Accounts Receivable"

    fill_in "Description", with: @backoffice_accounts_receivable.description
    fill_in "Expiration Date", with: @backoffice_accounts_receivable.expiration_date
    fill_in "Issue Date", with: @backoffice_accounts_receivable.issue_date
    fill_in "Kind", with: @backoffice_accounts_receivable.kind
    fill_in "Parcel", with: @backoffice_accounts_receivable.parcel
    fill_in "Payment Type", with: @backoffice_accounts_receivable.payment_type_id
    fill_in "Received Date", with: @backoffice_accounts_receivable.received_date
    fill_in "Received Value", with: @backoffice_accounts_receivable.received_value
    fill_in "Remaining Value", with: @backoffice_accounts_receivable.remaining_value
    fill_in "Sales", with: @backoffice_accounts_receivable.sales_id
    fill_in "State", with: @backoffice_accounts_receivable.state
    fill_in "System User", with: @backoffice_accounts_receivable.system_user_id
    fill_in "Total Parcels", with: @backoffice_accounts_receivable.total_parcels
    fill_in "Total Value", with: @backoffice_accounts_receivable.total_value
    click_on "Create Accounts receivable"

    assert_text "Accounts receivable was successfully created"
    click_on "Back"
  end

  test "updating a Accounts receivable" do
    visit backoffice_accounts_receivables_url
    click_on "Edit", match: :first

    fill_in "Description", with: @backoffice_accounts_receivable.description
    fill_in "Expiration Date", with: @backoffice_accounts_receivable.expiration_date
    fill_in "Issue Date", with: @backoffice_accounts_receivable.issue_date
    fill_in "Kind", with: @backoffice_accounts_receivable.kind
    fill_in "Parcel", with: @backoffice_accounts_receivable.parcel
    fill_in "Payment Type", with: @backoffice_accounts_receivable.payment_type_id
    fill_in "Received Date", with: @backoffice_accounts_receivable.received_date
    fill_in "Received Value", with: @backoffice_accounts_receivable.received_value
    fill_in "Remaining Value", with: @backoffice_accounts_receivable.remaining_value
    fill_in "Sales", with: @backoffice_accounts_receivable.sales_id
    fill_in "State", with: @backoffice_accounts_receivable.state
    fill_in "System User", with: @backoffice_accounts_receivable.system_user_id
    fill_in "Total Parcels", with: @backoffice_accounts_receivable.total_parcels
    fill_in "Total Value", with: @backoffice_accounts_receivable.total_value
    click_on "Update Accounts receivable"

    assert_text "Accounts receivable was successfully updated"
    click_on "Back"
  end

  test "destroying a Accounts receivable" do
    visit backoffice_accounts_receivables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Accounts receivable was successfully destroyed"
  end
end
