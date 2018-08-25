class ItemSale < ApplicationRecord
	belongs_to :product
	belongs_to :sale

	validates :product_id, :amount, presence: true
	validates :amount, numericality: { greater_than_or_equal_to: 1 }

	before_save :set_total
	validate :check_quantity

	def check_quantity
		if self.amount > self.product.stock
			errors[:amount] << "Quantidade de item insuficiente. Produto atualmente só tem #{self.product.stock} items."
			throw :abort
		end
	end

	def set_total
		if self.amount.blank?
			0
		else
			self.total_value = self.amount * self.product.sale_price
		end
	end

end
