class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_code, limit: 100, null: false
      t.string :description, limit: 100, null: false
      t.decimal :purchase_price, default: 0
      t.decimal :sale_price, null: false
      t.decimal :profit_margin, default: 0
      t.integer :stock
      t.integer :stock_reserved, default: 0
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
