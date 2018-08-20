class CreateItemBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :item_budgets do |t|
      t.integer :amount, null: false, default: 0
      t.decimal :value, null: false, precision: 8, scale: 2
      t.references :product, foreign_key: true
      t.references :budget, foreign_key: true

      t.timestamps
    end
  end
end
