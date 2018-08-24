class Purchase < ApplicationRecord
	belongs_to :provider
	has_many :accounts_payables
	has_many :item_purchases, dependent: :destroy
	has_many :products, through: :item_purchases

	validates :item_purchases, :total_value, presence: true

	accepts_nested_attributes_for :item_purchases, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :products, reject_if: :all_blank, allow_destroy: true

	before_save  :set_value_total
	after_create :atualiza_estoque_aumenta

	def atualiza_estoque_aumenta
		products.each do |product|
			item_purchase = item_purchases.find_by(product_id: product)
			product.stock += item_purchase.amount
			product.save
		end
	end

	def atualiza_estoque_diminui
		products.each do |product|
			item_purchase = item_purchase.find_by(product_id: product)
			product.stock -= item_purchase.amount
			product.save
		end
	end

	def valida_item_compra
		if item_purchase.empty?
			errors.add(:base, 'Compra deve ter ao menos um item')
		end
	end

	def set_value_total
		self.total_value = 0
		value_aux = self.item_purchases.map{|ip| ip.amount * ip.product.purchase_price}.sum
		self.total_value = value_aux + self.freight_value

		self.item_purchases.each do |item_purchase|
			item_purchase.value = item_purchase.product.purchase_price
			item_purchase.save
		end
	end

end
