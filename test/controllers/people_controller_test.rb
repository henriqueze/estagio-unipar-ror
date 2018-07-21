require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:one)
  end

  test "should get index" do
    get people_url
    assert_response :success
  end

  test "should get new" do
    get new_person_url
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post people_url, params: { person: { address: @person.address, address_bairro: @person.address_bairro, address_city: @person.address_city, address_complement: @person.address_complement, address_number: @person.address_number, address_state: @person.address_state, address_zip: @person.address_zip, company_name: @person.company_name, kind: @person.kind, name: @person.name, personC_cnpj: @person.personC_cnpj, personC_ie: @person.personC_ie, person_cpf: @person.person_cpf, person_email: @person.person_email, person_obs: @person.person_obs, person_rg: @person.person_rg, person_tel1: @person.person_tel1, person_tel2: @person.person_tel2 } }
    end

    assert_redirected_to person_url(Person.last)
  end

  test "should show person" do
    get person_url(@person)
    assert_response :success
  end

  test "should get edit" do
    get edit_person_url(@person)
    assert_response :success
  end

  test "should update person" do
    patch person_url(@person), params: { person: { address: @person.address, address_bairro: @person.address_bairro, address_city: @person.address_city, address_complement: @person.address_complement, address_number: @person.address_number, address_state: @person.address_state, address_zip: @person.address_zip, company_name: @person.company_name, kind: @person.kind, name: @person.name, personC_cnpj: @person.personC_cnpj, personC_ie: @person.personC_ie, person_cpf: @person.person_cpf, person_email: @person.person_email, person_obs: @person.person_obs, person_rg: @person.person_rg, person_tel1: @person.person_tel1, person_tel2: @person.person_tel2 } }
    assert_redirected_to person_url(@person)
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete person_url(@person)
    end

    assert_redirected_to people_url
  end
end
