class Sale < ApplicationRecord
	belongs_to :person
	belongs_to :payment_type
	has_many :accounts_receivable
	has_many :item_sale
	has_many :product, through: :item_sale


	accepts_nested_attributes_for :item_sale
	accepts_nested_attributes_for :product

end
