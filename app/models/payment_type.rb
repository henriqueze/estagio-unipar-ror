class PaymentType < ApplicationRecord
	has_many :accounts_receivable
	has_many :sale

	validates_numericality_of :interest_rates, :max_parcel, length: { in: 1..10}
	validates_presence_of :kind, :description
	validates :kind, uniqueness: { case_sensitive: false }
end
