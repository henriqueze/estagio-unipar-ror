class Sale < ApplicationRecord
	belongs_to :person
	belongs_to :payment_type

	has_many :accounts_receivables
	has_many :item_sales, dependent: :destroy
	has_many :products, through: :item_sales

	validates :item_sales, :total_value, presence: true

	accepts_nested_attributes_for :item_sales, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :products, reject_if: :all_blank, allow_destroy: true

	before_save :set_value_total, :recebe_data
	after_save  :atualiza_estoque_aumenta, if: :venda_cancelada
	before_create :atualiza_status
	after_create :atualiza_estoque_diminui


	def recebe_data
		self.date = Date.today
	end

	def venda_cancelada
	 self.state == "Cancelada"
	end

	def atualiza_status
		if self.state == "Aberta"
			self.state = "Finalizada"
		else
			self.state = state
		end
	end

	def atualiza_estoque_diminui
		products.each do |product|
			item_sale = item_sales.find_by(product_id: product)
			product.stock -= item_sale.amount
			product.save
		end
	end

	def atualiza_estoque_aumenta
		products.each do |product|
			item_sale = item_sales.find_by(product_id: product)
			product.stock += item_sale.amount
			product.save
		end
	end

	def valida_produto_venda
		if item_sales.empty?
			errors.add(:base, 'Venda deve ter ao menos um item')
		end
	end

	def set_value_total
		self.total_value = 0
		value_aux = self.item_sales.map{|is| is.amount*is.product.sale_price}.sum
		self.total_value = value_aux - self.discount_value

		self.item_sales.each do |item_sale|
			item_sale.value = item_sale.product.sale_price
			item_sale.total_value = item_sale.product.sale_price * item_sale.amount
			item_sale.save
		end
	end



end

