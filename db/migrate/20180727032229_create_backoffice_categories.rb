class CreateBackofficeCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :backoffice_categories do |t|
      t.string :description

      t.timestamps
    end
  end
end
