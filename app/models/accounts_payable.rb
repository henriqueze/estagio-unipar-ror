class AccountsPayable < ApplicationRecord
	belongs_to :purchase, optional: true
	belongs_to :provider, optional: true

	validate :valida_datas
	validates :total_parcels, :current_parcel, numericality: { greater_than_or_equal_to: 1 }
	validates :payable_value, :additions_value, :discount_value, :total_value,
	 numericality: { greater_than_or_equal_to: 1 }, allow_blank: true
	validates :state, :description, :document_kind, :issue_date, :expiration_date,
	 :payable_value, :additions_value, :discount_value, :total_value, presence: true

	before_save :verifica_valor

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
