class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_code
      t.string :description
      t.float :purchase_price
      t.float :sale_price
      t.float :profit_margin
      t.integer :stock
      t.integer :stock_reserved
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
