class Budget < ApplicationRecord
	belongs_to :person
	has_many :item_budgets, dependent: :destroy
	has_many :products, through: :item_budgets

	validates :item_budgets, :total_value, :expiration_date, :kind, presence: true
	validate :valida_vencimento
	validates :total_value, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true

	accepts_nested_attributes_for :item_budgets, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :products, reject_if: :all_blank, allow_destroy: true

	before_save :set_value_total, :seta_data
	after_create :atualiza_estoque_diminui, :atualiza_estoque_reservado_aumenta
	after_save  :atualiza_estoque_aumenta, :atualiza_estoque_reservado_diminui, if: :cancelado
	after_save :atualiza_estoque_reservado_diminui, if: :aprovado

	def valida_vencimento
		if self.expiration_date < Date.today
			self.errors.add(:base, "Data de Vencimento deve ser maior que a Data de Hoje")
		end
	end

	def seta_data
		self.date = Date.today
	end

	def aprovado
		self.state == "Aprovado"
	end

	def cancelado
		self.state == "Cancelado"
	end

	def atualiza_estoque_diminui
		products.each do |product|
			item_budget = item_budgets.find_by(product_id: product)
			product.stock -= item_budget.amount
			product.save
		end
	end

	def atualiza_estoque_aumenta
		products.each do |product|
			item_budget = item_budgets.find_by(product_id: product)
			product.stock += item_budget.amount
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

	def atualiza_estoque_reservado_diminui
		products.each do |product|
			item_budget = item_budgets.find_by(product_id: product)
			product.stock_reserved -= item_budget.amount
			product.save
		end
	end

	def set_value_total
		self.total_value = 0
		self.total_value = self.item_budgets.map{|ib| ib.amount * ib.product.sale_price}.sum

		self.item_budgets.each do |item_budget|
			item_budget.value = item_budget.product.sale_price
			item_budget.save
		end
	end

	def valida_quantidade_produto
		if item_budgets.empty?
			errors.add(:base, 'Orçamento deve ter ao menos um item')
		end
	end
end
