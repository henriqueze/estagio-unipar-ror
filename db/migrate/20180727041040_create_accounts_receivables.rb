class CreateAccountsReceivables < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts_receivables do |t|
      t.string :state, null: false
      t.string :description, limit: 100, null: false
      t.string :kind, limit: 50
      t.datetime :issue_date, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.date :expiration_date, null: false
      t.date :received_date
      t.decimal :total_value, null: false, precision: 8, scale: 2
      t.decimal :received_value, default: 0, precision: 8, scale: 2
      t.decimal :remaining_value, precision: 8, scale: 2
      t.integer :total_parcels, null: false
      t.integer :parcel
      t.references :sale, foreign_key: true, null: true
      t.references :person, foreign_key: true, null: true

      t.timestamps
    end
  end
end
