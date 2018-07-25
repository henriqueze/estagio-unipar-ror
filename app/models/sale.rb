class Sale < ApplicationRecord
  belongs_to :person
  has_many :accounts_receivable
  has_many :item_sale
  has_many :product, through: :item_sale
end
