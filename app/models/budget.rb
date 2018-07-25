class Budget < ApplicationRecord
  belongs_to :person
  has_many :item_budget
  has_many :product, through: :item_budget
end
