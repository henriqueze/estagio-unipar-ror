require "application_system_test_case"

class AccountsReceivablesTest < ApplicationSystemTestCase
  setup do
    @accounts_receivable = accounts_receivables(:one)
  end

  test "visiting the index" do
    visit accounts_receivables_url
    assert_selector "h1", text: "Accounts Receivables"
  end

  test "creating a Accounts receivable" do
    visit accounts_receivables_url
    click_on "New Accounts Receivable"

    fill_in "Description", with: @accounts_receivable.description
    fill_in "Expiration Date", with: @accounts_receivable.expiration_date
    fill_in "Issue Date", with: @accounts_receivable.issue_date
    fill_in "Kind", with: @accounts_receivable.kind
    fill_in "Parcel", with: @accounts_receivable.parcel
    fill_in "Payment Type", with: @accounts_receivable.payment_type_id
    fill_in "Received Date", with: @accounts_receivable.received_date
    fill_in "Received Value", with: @accounts_receivable.received_value
    fill_in "Remaining Value", with: @accounts_receivable.remaining_value
    fill_in "Sales", with: @accounts_receivable.sales_id
    fill_in "State", with: @accounts_receivable.state
    fill_in "System User", with: @accounts_receivable.system_user_id
    fill_in "Total Parcels", with: @accounts_receivable.total_parcels
    fill_in "Total Value", with: @accounts_receivable.total_value
    click_on "Create Accounts receivable"

    assert_text "Accounts receivable was successfully created"
    click_on "Back"
  end

  test "updating a Accounts receivable" do
    visit accounts_receivables_url
    click_on "Edit", match: :first

    fill_in "Description", with: @accounts_receivable.description
    fill_in "Expiration Date", with: @accounts_receivable.expiration_date
    fill_in "Issue Date", with: @accounts_receivable.issue_date
    fill_in "Kind", with: @accounts_receivable.kind
    fill_in "Parcel", with: @accounts_receivable.parcel
    fill_in "Payment Type", with: @accounts_receivable.payment_type_id
    fill_in "Received Date", with: @accounts_receivable.received_date
    fill_in "Received Value", with: @accounts_receivable.received_value
    fill_in "Remaining Value", with: @accounts_receivable.remaining_value
    fill_in "Sales", with: @accounts_receivable.sales_id
    fill_in "State", with: @accounts_receivable.state
    fill_in "System User", with: @accounts_receivable.system_user_id
    fill_in "Total Parcels", with: @accounts_receivable.total_parcels
    fill_in "Total Value", with: @accounts_receivable.total_value
    click_on "Update Accounts receivable"

    assert_text "Accounts receivable was successfully updated"
    click_on "Back"
  end

  test "destroying a Accounts receivable" do
    visit accounts_receivables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Accounts receivable was successfully destroyed"
  end
end
