class ItemBudget < ApplicationRecord
	belongs_to :product
	belongs_to :budget

	validate :check_quantity

	validates :product_id, :amount, presence: true
	validates :amount, numericality: { greater_than_or_equal_to: 1 }

	def check_quantity
		if self.amount > self.product.stock
			errors[:amount] << "Quantidade de item insuficiente. Produto atualmente só tem #{self.product.stock} items."
			throw :abort
		end
	end
end
