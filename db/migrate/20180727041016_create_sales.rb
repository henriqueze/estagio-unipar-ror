class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.date :date, null: false
      t.decimal :total_value, null: false, precision: 8, scale: 2
      t.decimal :discount_value, default: 0, precision: 8, scale: 2
      t.string :state, limit: 20, null: false
      t.references :person, foreign_key: true
      t.references :payment_type, foreign_key: true

      t.timestamps
    end
  end
end
