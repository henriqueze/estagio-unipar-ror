class PaymentType < ApplicationRecord
	has_many :accounts_receivable
	has_many :sale
end
