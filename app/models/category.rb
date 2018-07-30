class Category < ApplicationRecord
	has_many :product

	validates :description, uniqueness: { case_sensitive: false }, presence: true,
		length: { minimum: 2 }
	validates :description, format: { with: /[[:alpha:]]/,
		message: "Aceita Somente Letras" }

	end
