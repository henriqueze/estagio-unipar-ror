class Person < ApplicationRecord
	String kind:[:Fisica, :Juridica]

	has_many :sales
	has_many :purchases
	has_many :budgets

	validates :person_cpf, :personC_cnpj, uniqueness:true
	validates :address_zip, :person_tel1, :name, presence: true

	validates_numericality_of :person_tel1, :person_tel2, length: { in: 8..11 },
	too_long: 'Deve ter no Maximo 10 numeros', too_short: 'Deve ter no minimo 8 Numeros',
	 format: { with: /\([0-9]{2}\) [0-9]{4,5}\-[0-9*]{4}/, message: 'Digite um Número de Telefone Válido' }
	validates :person_email, uniqueness: true, :allow_blank => true
	validates_format_of :person_email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :allow_blank => true

	validates_cpf_format_of :person_cpf, presence: true, if: :tipo_fisica?
	validates_cnpj_format_of :personC_cnpj, presence: true, if: :tipo_juridica?
	validates :address_zip, length: { in: 8..8 }
	validates_inclusion_of :kind, in: %w(Fisica Juridica), message: "Aceita somente Fisica ou Juridica"

	validates :name, :company_name, format: { with: /\A[a-zA-ZàáâãèéêìíóôõùúçÀÁÂĖÈÉÊÌÍÒÓÔÕÙÚÛÇ ]+\z/,
	 message: 'Apenas Permite Letras' }
	validates :address_state, presence: true, length: { is: 2 },
	 format: { with: /\A[a-zA-Z]+\z/, message: 'Apenas Permite Letras' }


def tipo_fisica?
	kind == "Fisica"
end

def tipo_juridica?
	kind == "Juridica"
end

end
