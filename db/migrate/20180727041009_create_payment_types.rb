class CreatePaymentTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_types do |t|
      t.string :kind, limit: 50, null: false
      t.string :description, limit: 100
      t.decimal :interest_rates, default: 0
      t.integer :max_parcel

      t.timestamps
    end
  end
end
