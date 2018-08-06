class Purchase < ApplicationRecord
  belongs_to :person
  has_many :accounts_payables
  has_many :item_purchases
  has_many :products, through: :item_purchases
end
