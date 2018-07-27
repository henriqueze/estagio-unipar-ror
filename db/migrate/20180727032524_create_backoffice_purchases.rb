class CreateBackofficePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :backoffice_purchases do |t|
      t.datetime :date
      t.decimal :total_value
      t.decimal :freight_value
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
