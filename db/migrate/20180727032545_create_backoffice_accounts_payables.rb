class CreateBackofficeAccountsPayables < ActiveRecord::Migration[5.2]
  def change
    create_table :backoffice_accounts_payables do |t|
      t.string :state
      t.string :description
      t.string :document_kind
      t.string :document_number
      t.datetime :issue_date
      t.datetime :expiration_date
      t.datetime :payment_date
      t.integer :total_parcels
      t.integer :current_parcel
      t.decimal :payable_value
      t.decimal :additions_value
      t.decimal :discount_value
      t.decimal :total_value
      t.decimal :paid_value
      t.longblob :voucher_image
      t.references :purchase, foreign_key: true
      t.string :system_user
      t.string :references

      t.timestamps
    end
  end
end
