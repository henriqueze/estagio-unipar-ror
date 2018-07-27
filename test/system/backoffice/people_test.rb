require "application_system_test_case"

class Backoffice::PeopleTest < ApplicationSystemTestCase
  setup do
    @backoffice_person = backoffice_people(:one)
  end

  test "visiting the index" do
    visit backoffice_people_url
    assert_selector "h1", text: "Backoffice/People"
  end

  test "creating a Person" do
    visit backoffice_people_url
    click_on "New Backoffice/Person"

    fill_in "Address", with: @backoffice_person.address
    fill_in "Address Bairro", with: @backoffice_person.address_bairro
    fill_in "Address City", with: @backoffice_person.address_city
    fill_in "Address Complement", with: @backoffice_person.address_complement
    fill_in "Address Number", with: @backoffice_person.address_number
    fill_in "Address State", with: @backoffice_person.address_state
    fill_in "Address Zip", with: @backoffice_person.address_zip
    fill_in "Company Name", with: @backoffice_person.company_name
    fill_in "Kind", with: @backoffice_person.kind
    fill_in "Name", with: @backoffice_person.name
    fill_in "Personc Cnpj", with: @backoffice_person.personC_cnpj
    fill_in "Personc Ie", with: @backoffice_person.personC_ie
    fill_in "Personc Provider", with: @backoffice_person.personC_provider
    fill_in "Person Cpf", with: @backoffice_person.person_cpf
    fill_in "Person Email", with: @backoffice_person.person_email
    fill_in "Person Obs", with: @backoffice_person.person_obs
    fill_in "Person Rg", with: @backoffice_person.person_rg
    fill_in "Person Tel1", with: @backoffice_person.person_tel1
    fill_in "Person Tel2", with: @backoffice_person.person_tel2
    click_on "Create Person"

    assert_text "Person was successfully created"
    click_on "Back"
  end

  test "updating a Person" do
    visit backoffice_people_url
    click_on "Edit", match: :first

    fill_in "Address", with: @backoffice_person.address
    fill_in "Address Bairro", with: @backoffice_person.address_bairro
    fill_in "Address City", with: @backoffice_person.address_city
    fill_in "Address Complement", with: @backoffice_person.address_complement
    fill_in "Address Number", with: @backoffice_person.address_number
    fill_in "Address State", with: @backoffice_person.address_state
    fill_in "Address Zip", with: @backoffice_person.address_zip
    fill_in "Company Name", with: @backoffice_person.company_name
    fill_in "Kind", with: @backoffice_person.kind
    fill_in "Name", with: @backoffice_person.name
    fill_in "Personc Cnpj", with: @backoffice_person.personC_cnpj
    fill_in "Personc Ie", with: @backoffice_person.personC_ie
    fill_in "Personc Provider", with: @backoffice_person.personC_provider
    fill_in "Person Cpf", with: @backoffice_person.person_cpf
    fill_in "Person Email", with: @backoffice_person.person_email
    fill_in "Person Obs", with: @backoffice_person.person_obs
    fill_in "Person Rg", with: @backoffice_person.person_rg
    fill_in "Person Tel1", with: @backoffice_person.person_tel1
    fill_in "Person Tel2", with: @backoffice_person.person_tel2
    click_on "Update Person"

    assert_text "Person was successfully updated"
    click_on "Back"
  end

  test "destroying a Person" do
    visit backoffice_people_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Person was successfully destroyed"
  end
end
