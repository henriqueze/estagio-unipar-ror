class Category < ApplicationRecord
	has_many :product

	validates :description, uniqueness: { case_sensitive: false}, presence: true,
				length: { minimum: 2 }
	validates :description, format: { with: /[[:alpha:]]/,
				message: "Aceita Somente Letras" }

	def self.search(search)
		if search
			where(['description LIKE ?', "%#{search}%"])
		else
			all
		end
	end

end
