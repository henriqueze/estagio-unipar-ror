class CreateBackofficePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :backoffice_people do |t|
      t.string :kind
      t.string :name
      t.string :company_name
      t.string :person_rg
      t.string :personC_ie
      t.string :person_cpf
      t.string :personC_cnpj
      t.string :personC_provider
      t.string :address
      t.string :address_number
      t.string :address_complement
      t.string :address_bairro
      t.bigint :address_zip
      t.string :address_city
      t.string :address_state
      t.bigint :person_tel1
      t.bigint :person_tel2
      t.string :person_email
      t.string :person_obs

      t.timestamps
    end
  end
end
