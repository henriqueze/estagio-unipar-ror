class Budget < ApplicationRecord
	belongs_to :person
	has_many :item_budgets, dependent: :destroy
	has_many :products, through: :item_budgets

	validates :item_budgets, :total_value, presence: true

	accepts_nested_attributes_for :item_budgets, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :products, reject_if: :all_blank, allow_destroy: true

	def atualiza_estoque_diminui
		products.each do |product|
			item_budget = item_budgets.find_by(product_id: product)
			product.stock -= item_budget.amount
			product.save
		end
	end

	def atualiza_estoque_reservado_aumenta
		products.each do |product|
			item_budget = item_budgets.find_by(product_id: product)
			product.stock_reserved += item_budget.amount
			product.save
		end
	end

	private

	def valida_quantidade_produto
		if item_budgets.empty?
			errors.add(:base, 'Pedido deve ter ao menos um item')
		end
	end
end
