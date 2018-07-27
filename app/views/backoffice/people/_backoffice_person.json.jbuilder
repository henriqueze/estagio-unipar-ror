json.extract! backoffice_person, :id, :kind, :name, :company_name, :person_rg, :personC_ie, :person_cpf, :personC_cnpj, :personC_provider, :address, :address_number, :address_complement, :address_bairro, :address_zip, :address_city, :address_state, :person_tel1, :person_tel2, :person_email, :person_obs, :created_at, :updated_at
json.url backoffice_person_url(backoffice_person, format: :json)
