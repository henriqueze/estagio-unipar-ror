class CreateBackofficeBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :backoffice_budgets do |t|
      t.string :kind
      t.string :note
      t.datetime :date
      t.datetime :expiration_date
      t.decimal :total_value
      t.string :state
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
