class PaymentType < ApplicationRecord
	has_many :accounts_receivable
end
