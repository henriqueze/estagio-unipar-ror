class ItemPurchase < ApplicationRecord
	belongs_to :product
	belongs_to :purchase

	validates :product_id, presence: true
	validates :amount, numericality: { greater_than_or_equal_to: 1 }



end
