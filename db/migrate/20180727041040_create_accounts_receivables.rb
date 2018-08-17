class CreateAccountsReceivables < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts_receivables do |t|
      t.string :state, null: false
      t.string :description, limit: 100, null: false
      t.string :kind, limit: 50
      t.datetime :issue_date, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :expiration_date, null: false
      t.datetime :received_date
      t.decimal :total_value, null: false
      t.decimal :received_value, default: 0
      t.decimal :remaining_value
      t.integer :total_parcels, null: false
      t.integer :parcel
      t.references :sale, foreign_key: true

      t.timestamps
    end
  end
end
