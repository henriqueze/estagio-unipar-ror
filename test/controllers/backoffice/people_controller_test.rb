require 'test_helper'

class Backoffice::PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @backoffice_person = backoffice_people(:one)
  end

  test "should get index" do
    get backoffice_people_url
    assert_response :success
  end

  test "should get new" do
    get new_backoffice_person_url
    assert_response :success
  end

  test "should create backoffice_person" do
    assert_difference('Backoffice::Person.count') do
      post backoffice_people_url, params: { backoffice_person: { address: @backoffice_person.address, address_bairro: @backoffice_person.address_bairro, address_city: @backoffice_person.address_city, address_complement: @backoffice_person.address_complement, address_number: @backoffice_person.address_number, address_state: @backoffice_person.address_state, address_zip: @backoffice_person.address_zip, company_name: @backoffice_person.company_name, kind: @backoffice_person.kind, name: @backoffice_person.name, personC_cnpj: @backoffice_person.personC_cnpj, personC_ie: @backoffice_person.personC_ie, personC_provider: @backoffice_person.personC_provider, person_cpf: @backoffice_person.person_cpf, person_email: @backoffice_person.person_email, person_obs: @backoffice_person.person_obs, person_rg: @backoffice_person.person_rg, person_tel1: @backoffice_person.person_tel1, person_tel2: @backoffice_person.person_tel2 } }
    end

    assert_redirected_to backoffice_person_url(Backoffice::Person.last)
  end

  test "should show backoffice_person" do
    get backoffice_person_url(@backoffice_person)
    assert_response :success
  end

  test "should get edit" do
    get edit_backoffice_person_url(@backoffice_person)
    assert_response :success
  end

  test "should update backoffice_person" do
    patch backoffice_person_url(@backoffice_person), params: { backoffice_person: { address: @backoffice_person.address, address_bairro: @backoffice_person.address_bairro, address_city: @backoffice_person.address_city, address_complement: @backoffice_person.address_complement, address_number: @backoffice_person.address_number, address_state: @backoffice_person.address_state, address_zip: @backoffice_person.address_zip, company_name: @backoffice_person.company_name, kind: @backoffice_person.kind, name: @backoffice_person.name, personC_cnpj: @backoffice_person.personC_cnpj, personC_ie: @backoffice_person.personC_ie, personC_provider: @backoffice_person.personC_provider, person_cpf: @backoffice_person.person_cpf, person_email: @backoffice_person.person_email, person_obs: @backoffice_person.person_obs, person_rg: @backoffice_person.person_rg, person_tel1: @backoffice_person.person_tel1, person_tel2: @backoffice_person.person_tel2 } }
    assert_redirected_to backoffice_person_url(@backoffice_person)
  end

  test "should destroy backoffice_person" do
    assert_difference('Backoffice::Person.count', -1) do
      delete backoffice_person_url(@backoffice_person)
    end

    assert_redirected_to backoffice_people_url
  end
end
