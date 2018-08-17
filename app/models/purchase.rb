class Purchase < ApplicationRecord
	belongs_to :provider
	has_many :accounts_payables
	has_many :item_purchases, dependent: :destroy
	has_many :products, through: :item_purchases

	validates :item_purchases, :total_value, presence: true

	accepts_nested_attributes_for :item_purchases, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :products, reject_if: :all_blank, allow_destroy: true

	after_create :atualiza_estoque_aumenta


	def atualiza_estoque_aumenta
		products.each do |product|
			item_purchase = item_purchases.find_by(product_id: product)
			product.stock += item_purchase.amount
			product.save
		end
	end

	private

	def valida_quantidade_produto
		if item_purchase.empty?
			errors.add(:base, 'Compra deve ter ao menos um item')
		end
	end
end
