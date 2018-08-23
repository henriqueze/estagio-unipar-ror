class AccountsReceivable < ApplicationRecord
	belongs_to :sale, optional: true
	belongs_to :person, optional: true

	validate :valida_datas

	before_save :verifica_valor

	def verifica_valor
		if self.total_value == self.received_value
			self.state = "Paga"
		end
	end

	def valida_datas
		if self.expiration_date < self.issue_date
			self.errors.add(:base, 'Data de Vencimento deve ser maior')
		end
	end

	def cria_parcelas
		i = 0
		aux = 2
		if self.total_parcels > 1
			i = self.total_parcels
			i -= 1
			for conta in 1..i
				conta = AccountsReceivable.new
				conta.state = self.state = "Aberta"
				conta.description = self.description
				conta.kind = self.kind
				conta.issue_date = self.issue_date
				conta.expiration_date = expiration_date = Time.current + 30.day
				conta.received_date = self.received_date
				conta.total_value = self.total_value
				conta.remaining_value = self.remaining_value
				conta.total_parcels = self.total_parcels
				conta.parcel = aux
				conta.sale = self.sale
				conta.save
				aux += 1
			end
		else
			self.state = "Fechada"
		end
	end

end
