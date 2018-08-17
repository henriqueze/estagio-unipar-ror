class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.datetime :date, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.decimal :total_value, null: false
      t.decimal :freight_value, default: 0
      t.references :provider, foreign_key: true

      t.timestamps
    end
  end
end
