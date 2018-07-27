class CreateBackofficeProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :backoffice_products do |t|
      t.string :product_code
      t.string :description
      t.decimal :purchase_price
      t.decimal :sale_price
      t.decimal :profit_margin
      t.integer :stock
      t.integer :stock_reserved
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
