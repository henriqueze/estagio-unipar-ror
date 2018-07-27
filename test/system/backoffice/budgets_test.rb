require "application_system_test_case"

class Backoffice::BudgetsTest < ApplicationSystemTestCase
  setup do
    @backoffice_budget = backoffice_budgets(:one)
  end

  test "visiting the index" do
    visit backoffice_budgets_url
    assert_selector "h1", text: "Backoffice/Budgets"
  end

  test "creating a Budget" do
    visit backoffice_budgets_url
    click_on "New Backoffice/Budget"

    fill_in "Date", with: @backoffice_budget.date
    fill_in "Expiration Date", with: @backoffice_budget.expiration_date
    fill_in "Kind", with: @backoffice_budget.kind
    fill_in "Note", with: @backoffice_budget.note
    fill_in "Person", with: @backoffice_budget.person_id
    fill_in "State", with: @backoffice_budget.state
    fill_in "Total Value", with: @backoffice_budget.total_value
    click_on "Create Budget"

    assert_text "Budget was successfully created"
    click_on "Back"
  end

  test "updating a Budget" do
    visit backoffice_budgets_url
    click_on "Edit", match: :first

    fill_in "Date", with: @backoffice_budget.date
    fill_in "Expiration Date", with: @backoffice_budget.expiration_date
    fill_in "Kind", with: @backoffice_budget.kind
    fill_in "Note", with: @backoffice_budget.note
    fill_in "Person", with: @backoffice_budget.person_id
    fill_in "State", with: @backoffice_budget.state
    fill_in "Total Value", with: @backoffice_budget.total_value
    click_on "Update Budget"

    assert_text "Budget was successfully updated"
    click_on "Back"
  end

  test "destroying a Budget" do
    visit backoffice_budgets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Budget was successfully destroyed"
  end
end
