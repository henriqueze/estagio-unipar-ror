module ApplicationHelper

	def valor_formatado(number)
	  number_to_currency number,
	    unit: "R$",
	    separator: ",",
	    delimiter: "."
	end

	def percentual_formatado(number)
	  number_to_percentage number,
	    separator: ",",
	    precision: 1
	end

	def self.search(search)
		if search
			where(['description LIKE ?', "%#{search}%"])
		else
			all
		end
	end

end
