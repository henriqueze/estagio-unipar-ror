require "application_system_test_case"

class Backoffice::PaymentTypesTest < ApplicationSystemTestCase
  setup do
    @backoffice_payment_type = backoffice_payment_types(:one)
  end

  test "visiting the index" do
    visit backoffice_payment_types_url
    assert_selector "h1", text: "Backoffice/Payment Types"
  end

  test "creating a Payment type" do
    visit backoffice_payment_types_url
    click_on "New Backoffice/Payment Type"

    fill_in "Description", with: @backoffice_payment_type.description
    fill_in "Interest Rates", with: @backoffice_payment_type.interest_rates
    fill_in "Kind", with: @backoffice_payment_type.kind
    fill_in "Max Parcel", with: @backoffice_payment_type.max_parcel
    click_on "Create Payment type"

    assert_text "Payment type was successfully created"
    click_on "Back"
  end

  test "updating a Payment type" do
    visit backoffice_payment_types_url
    click_on "Edit", match: :first

    fill_in "Description", with: @backoffice_payment_type.description
    fill_in "Interest Rates", with: @backoffice_payment_type.interest_rates
    fill_in "Kind", with: @backoffice_payment_type.kind
    fill_in "Max Parcel", with: @backoffice_payment_type.max_parcel
    click_on "Update Payment type"

    assert_text "Payment type was successfully updated"
    click_on "Back"
  end

  test "destroying a Payment type" do
    visit backoffice_payment_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Payment type was successfully destroyed"
  end
end
