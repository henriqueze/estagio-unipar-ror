require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase
  setup do
    @person = people(:one)
  end

  test "visiting the index" do
    visit people_url
    assert_selector "h1", text: "People"
  end

  test "creating a Person" do
    visit people_url
    click_on "New Person"

    fill_in "Address", with: @person.address
    fill_in "Address Bairro", with: @person.address_bairro
    fill_in "Address City", with: @person.address_city
    fill_in "Address Complement", with: @person.address_complement
    fill_in "Address Number", with: @person.address_number
    fill_in "Address State", with: @person.address_state
    fill_in "Address Zip", with: @person.address_zip
    fill_in "Company Name", with: @person.company_name
    fill_in "Kind", with: @person.kind
    fill_in "Name", with: @person.name
    fill_in "Personc Cnpj", with: @person.personC_cnpj
    fill_in "Personc Ie", with: @person.personC_ie
    fill_in "Person Cpf", with: @person.person_cpf
    fill_in "Person Email", with: @person.person_email
    fill_in "Person Obs", with: @person.person_obs
    fill_in "Person Rg", with: @person.person_rg
    fill_in "Person Tel1", with: @person.person_tel1
    fill_in "Person Tel2", with: @person.person_tel2
    click_on "Create Person"

    assert_text "Person was successfully created"
    click_on "Back"
  end

  test "updating a Person" do
    visit people_url
    click_on "Edit", match: :first

    fill_in "Address", with: @person.address
    fill_in "Address Bairro", with: @person.address_bairro
    fill_in "Address City", with: @person.address_city
    fill_in "Address Complement", with: @person.address_complement
    fill_in "Address Number", with: @person.address_number
    fill_in "Address State", with: @person.address_state
    fill_in "Address Zip", with: @person.address_zip
    fill_in "Company Name", with: @person.company_name
    fill_in "Kind", with: @person.kind
    fill_in "Name", with: @person.name
    fill_in "Personc Cnpj", with: @person.personC_cnpj
    fill_in "Personc Ie", with: @person.personC_ie
    fill_in "Person Cpf", with: @person.person_cpf
    fill_in "Person Email", with: @person.person_email
    fill_in "Person Obs", with: @person.person_obs
    fill_in "Person Rg", with: @person.person_rg
    fill_in "Person Tel1", with: @person.person_tel1
    fill_in "Person Tel2", with: @person.person_tel2
    click_on "Update Person"

    assert_text "Person was successfully updated"
    click_on "Back"
  end

  test "destroying a Person" do
    visit people_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Person was successfully destroyed"
  end
end
