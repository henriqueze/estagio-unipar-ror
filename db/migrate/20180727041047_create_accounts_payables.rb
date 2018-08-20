class CreateAccountsPayables < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts_payables do |t|
      t.string :state, limit: 20, null: false
      t.string :description, limit: 100, null: false
      t.string :document_kind, limit: 20
      t.string :document_number, limit: 100
      t.datetime :issue_date, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.date :expiration_date, null: false
      t.date :payment_date
      t.integer :total_parcels, null: false, default: 0
      t.integer :current_parcel, default: 0
      t.decimal :payable_value, null: false, precision: 8, scale: 2
      t.decimal :additions_value, default: 0, precision: 8, scale: 2
      t.decimal :discount_value, default: 0, precision: 8, scale: 2
      t.decimal :total_value, null: false, precision: 8, scale: 2
      t.decimal :paid_value, default: 0, precision: 8, scale: 2
      t.longblob :voucher_image
      t.references :purchase, foreign_key: true, null: true
      t.references :provider, foreign_key: true, null: true
      t.references :system_user, foreign_key: true

      t.timestamps
    end
  end
end
