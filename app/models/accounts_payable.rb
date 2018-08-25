class AccountsPayable < ApplicationRecord
	belongs_to :purchase, optional: true
	belongs_to :provider, optional: true

	validate :valida_datas, :valida_data_criada
	validates :total_parcels, :current_parcel, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
	validates :payable_value, :additions_value, :discount_value, :total_value,
	numericality: { greater_than_or_equal_to: 1 }, allow_blank: true
	validates :state, :description, :document_kind, :issue_date, :expiration_date,
	:payable_value, :total_value, presence: true

	before_save :verifica_valor, :set_valor_total

	def set_valor_total
		self.total_value = self.payable_value + self.additions_value - self.discount_value
	end

	def valida_data_criada
		if self.issue_date > Date.today
			self.errors.add(:base, 'Data de Emissão nao pode ser Futura')
		end
	end

	def verifica_valor
		if self.total_value == self.paid_value
			self.state = "Paga"
			self.payment_date = Date.today
		else
			self.state = "Aberta"
		end
	end

	def valida_datas
		if self.expiration_date < self.issue_date
			self.errors.add(:base, 'Data de Vencimento deve ser maior')
		end
	end

end
