class Budget < ApplicationRecord
  belongs_to :person
  has_many :item_budgets
  has_many :products, through: :item_budgets
end
