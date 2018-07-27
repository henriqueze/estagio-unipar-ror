class Purchase < ApplicationRecord
  belongs_to :person
  has_many :accounts_payable
  has_many :item_purchase
  has_many :products, through: :item_purchase
end
