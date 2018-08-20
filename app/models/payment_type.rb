class PaymentType < ApplicationRecord
	#has_many :accounts_receivables
	has_many :sales
	has_many :accounts_receivables

	validates_numericality_of :interest_rates, :max_parcel, length: { in: 1..10}
	validates_presence_of :kind, :description
	validates :kind, uniqueness: { case_sensitive: false }
end
