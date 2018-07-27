class CreateBackofficeItemSales < ActiveRecord::Migration[5.2]
  def change
    create_table :backoffice_item_sales do |t|
      t.integer :amount
      t.decimal :value
      t.references :product, foreign_key: true
      t.references :sale, foreign_key: true

      t.timestamps
    end
  end
end
