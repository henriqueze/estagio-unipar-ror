class ItemSale < ApplicationRecord
	belongs_to :product
	belongs_to :sale

	validates :product_id, presence: true
	validates :amount, numericality: { greater_than_or_equal_to: 1 }

	before_save :set_total

	def set_total
		if self.amount.blank?
			0
		else
			self.total_value = self.amount * self.product.sale_price
		end
	end

	def subtotal
		if self.amount.blank?
			0
		else
			self.amount * self.product.sale_price
		end
	end

end
