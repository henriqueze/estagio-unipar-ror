class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string :name, limit: 100
      t.string :provider_rasocial, limit: 100, null: false
      t.string :provider_ie
      t.string :provider_cnpj, null: false
      t.string :provider_tel1, null: false
      t.string :provider_tel2
      t.string :address, limit: 100, default: ""
      t.string :address_number, limit: 50, default: ""
      t.string :address_complement, limit: 100
      t.string :address_bairro
      t.string :address_city, limit: 100, null: false
      t.string :address_state, limit: 50, null: false
      t.string :address_zip, null: false
      t.string :provider_email, default: ""

      t.timestamps
    end
  end
end
