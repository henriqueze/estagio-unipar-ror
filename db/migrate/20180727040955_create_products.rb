class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_code, limit: 100, null: false
      t.string :description, limit: 100, null: false
      t.decimal :purchase_price, default: 0, precision: 8, scale: 2
      t.decimal :sale_price, null: false, precision: 8, scale: 2
      t.decimal :profit_margin, precision: 8, scale: 2
      t.integer :stock
      t.integer :stock_reserved, default: 0
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
