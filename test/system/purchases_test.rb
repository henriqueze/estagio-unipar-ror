require "application_system_test_case"

class PurchasesTest < ApplicationSystemTestCase
  setup do
    @purchase = purchases(:one)
  end

  test "visiting the index" do
    visit purchases_url
    assert_selector "h1", text: "Purchases"
  end

  test "creating a Purchase" do
    visit purchases_url
    click_on "New Purchase"

    fill_in "Date", with: @purchase.date
    fill_in "Freight Value", with: @purchase.freight_value
    fill_in "Person", with: @purchase.person_id
    fill_in "Total Value", with: @purchase.total_value
    click_on "Create Purchase"

    assert_text "Purchase was successfully created"
    click_on "Back"
  end

  test "updating a Purchase" do
    visit purchases_url
    click_on "Edit", match: :first

    fill_in "Date", with: @purchase.date
    fill_in "Freight Value", with: @purchase.freight_value
    fill_in "Person", with: @purchase.person_id
    fill_in "Total Value", with: @purchase.total_value
    click_on "Update Purchase"

    assert_text "Purchase was successfully updated"
    click_on "Back"
  end

  test "destroying a Purchase" do
    visit purchases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Purchase was successfully destroyed"
  end
end