class Person < ApplicationRecord
	String kind:[:Fisica, :Juridica]

	has_many :sale
	has_many :purchase
	has_many :budget

	validates :person_cpf, :personC_cnpj, uniqueness:true, :allow_blank => true
	validates :address_zip, :person_tel1, :name, presence: true

end
