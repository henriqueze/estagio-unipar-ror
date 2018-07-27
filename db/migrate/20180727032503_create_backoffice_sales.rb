class CreateBackofficeSales < ActiveRecord::Migration[5.2]
  def change
    create_table :backoffice_sales do |t|
      t.datetime :date
      t.decimal :total_value
      t.decimal :discount_value
      t.string :state
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
