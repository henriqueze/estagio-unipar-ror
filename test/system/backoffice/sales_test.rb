require "application_system_test_case"

class Backoffice::SalesTest < ApplicationSystemTestCase
  setup do
    @backoffice_sale = backoffice_sales(:one)
  end

  test "visiting the index" do
    visit backoffice_sales_url
    assert_selector "h1", text: "Backoffice/Sales"
  end

  test "creating a Sale" do
    visit backoffice_sales_url
    click_on "New Backoffice/Sale"

    fill_in "Date", with: @backoffice_sale.date
    fill_in "Discount Value", with: @backoffice_sale.discount_value
    fill_in "Person", with: @backoffice_sale.person_id
    fill_in "State", with: @backoffice_sale.state
    fill_in "Total Value", with: @backoffice_sale.total_value
    click_on "Create Sale"

    assert_text "Sale was successfully created"
    click_on "Back"
  end

  test "updating a Sale" do
    visit backoffice_sales_url
    click_on "Edit", match: :first

    fill_in "Date", with: @backoffice_sale.date
    fill_in "Discount Value", with: @backoffice_sale.discount_value
    fill_in "Person", with: @backoffice_sale.person_id
    fill_in "State", with: @backoffice_sale.state
    fill_in "Total Value", with: @backoffice_sale.total_value
    click_on "Update Sale"

    assert_text "Sale was successfully updated"
    click_on "Back"
  end

  test "destroying a Sale" do
    visit backoffice_sales_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sale was successfully destroyed"
  end
end
