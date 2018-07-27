class CreateBackofficePaymentTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :backoffice_payment_types do |t|
      t.string :kind
      t.string :description
      t.decimal :interest_rates
      t.integer :max_parcel

      t.timestamps
    end
  end
end
