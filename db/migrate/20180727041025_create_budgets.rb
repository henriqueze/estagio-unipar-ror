class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.string :kind, limit: 20
      t.string :note, limit: 200
      t.date :date, null: false
      t.date :expiration_date, null: false
      t.decimal :total_value, null: false, precision: 8, scale: 2
      t.string :state, limit: 20, null: false
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
