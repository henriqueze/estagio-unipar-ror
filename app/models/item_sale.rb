class ItemSale < ApplicationRecord
	belongs_to :product
	belongs_to :sale

	validates :amount, numericality: { greater_than_or_equal_to: 1 }

	def subtotal
		product.sale_price * amount
	end
end

end
