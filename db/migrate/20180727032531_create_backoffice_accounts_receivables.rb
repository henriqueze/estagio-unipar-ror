class CreateBackofficeAccountsReceivables < ActiveRecord::Migration[5.2]
  def change
    create_table :backoffice_accounts_receivables do |t|
      t.string :state
      t.string :description
      t.string :kind
      t.datetime :issue_date
      t.datetime :expiration_date
      t.datetime :received_date
      t.decimal :total_value
      t.decimal :received_value
      t.decimal :remaining_value
      t.integer :total_parcels
      t.integer :parcel
      t.references :sales, foreign_key: true
      t.references :payment_type, foreign_key: true
      t.references :system_user, foreign_key: true

      t.timestamps
    end
  end
end
