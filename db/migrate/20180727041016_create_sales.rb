class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.datetime :date, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.decimal :total_value, null: false
      t.decimal :discount_value, default: 0
      t.string :state, limit: 20, null: false, default: "Aberta"
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
