class CreatePaymentTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_types do |t|
      t.string :kind
      t.string :description
      t.float :interest_rates
      t.integer :max_parcel

      t.timestamps
    end
  end
end
