class AccountsReceivable < ApplicationRecord
	belongs_to :sale

	def cria_parcelas
		i = 0
		if self.total_parcels > 1
			i = self.total_parcels
			i -= 1
			i.times do |conta|
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
				conta.parcel = i
				conta.sale = self.sale
				conta.save
			end
		else
			self.state = "Fechada"
		end
	end

end
