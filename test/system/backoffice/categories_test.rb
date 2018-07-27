require "application_system_test_case"

class Backoffice::CategoriesTest < ApplicationSystemTestCase
  setup do
    @backoffice_category = backoffice_categories(:one)
  end

  test "visiting the index" do
    visit backoffice_categories_url
    assert_selector "h1", text: "Backoffice/Categories"
  end

  test "creating a Category" do
    visit backoffice_categories_url
    click_on "New Backoffice/Category"

    fill_in "Description", with: @backoffice_category.description
    click_on "Create Category"

    assert_text "Category was successfully created"
    click_on "Back"
  end

  test "updating a Category" do
    visit backoffice_categories_url
    click_on "Edit", match: :first

    fill_in "Description", with: @backoffice_category.description
    click_on "Update Category"

    assert_text "Category was successfully updated"
    click_on "Back"
  end

  test "destroying a Category" do
    visit backoffice_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Category was successfully destroyed"
  end
end
