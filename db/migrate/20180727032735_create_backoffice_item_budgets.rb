class CreateBackofficeItemBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :backoffice_item_budgets do |t|
      t.integer :amount
      t.decimal :value
      t.references :product, foreign_key: true
      t.references :budget, foreign_key: true

      t.timestamps
    end
  end
end
