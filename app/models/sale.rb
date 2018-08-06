class Sale < ApplicationRecord
	belongs_to :person
	belongs_to :payment_type
	has_many :accounts_receivables
	has_many :item_sales
	has_many :products, through: :item_sales


	accepts_nested_attributes_for :item_sales
	accepts_nested_attributes_for :products

end
