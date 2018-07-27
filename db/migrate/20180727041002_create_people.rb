class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :kind, limit: 20, null: false
      t.string :name, limit: 100, default: ""
      t.string :company_name, limit: 200, default: ""
      t.string :person_rg, default: ""
      t.string :personC_ie, default: ""
      t.string :person_cpf, default: ""
      t.string :personC_cnpj, default: ""
      t.string :personC_provider, limit: 3, default: "Não"
      t.string :address, limit: 100, default: ""
      t.string :address_number, limit: 50, default: ""
      t.string :address_complement, limit: 100, default: ""
      t.string :address_bairro, limit: 100, default: ""
      t.bigint :address_zip, null: false
      t.string :address_city, limit: 100, null: false
      t.string :address_state, limit: 50, null: false
      t.bigint :person_tel1, null: false
      t.bigint :person_tel2
      t.string :person_email, limit: 100, default: ""
      t.string :person_obs, limit: 200, default: ""

      t.timestamps
    end
  end
end
