class Provider < ApplicationRecord
	has_many :purchases
	has_many :accounts_payables

	validates :provider_cnpj, :provider_ie, uniqueness: true
	validates :address_zip, :provider_tel1, :provider_rasocial, presence: true

	validates_numericality_of :provider_tel1, length: { in: 8..11 },
	too_long: 'Deve ter no Maximo 10 numeros', too_short: 'Deve ter no minimo 8 Numeros',
	format: { with: /\([0-9]{2}\) [0-9]{4,5}\-[0-9*]{4}/,
	message: 'Digite um Número de Telefone Válido' }

	validates_numericality_of :provider_tel2, length: { in: 8..11 },
	too_long: 'Deve ter no Maximo 10 numeros', too_short: 'Deve ter no minimo 8 Numeros',
	format: { with: /\([0-9]{2}\) [0-9]{4,5}\-[0-9*]{4}/,
	message: 'Digite um Número de Telefone Válido' }, :allow_blank => true

	validates_cnpj_format_of :provider_cnpj, presence: true
	validates :address_zip, length: { in: 8..8 }

	validates :name, :provider_rasocial,
	format: { with: /\A[a-zA-ZàáâãèéêìíóôõùúçÀÁÂĖÈÉÊÌÍÒÓÔÕÙÚÛÇ ]+\z/,
		message: 'Apenas Permite Letras' }, :allow_blank => true

	validates :address_state, presence: true, length: { is: 2 },
	format: { with: /\A[a-zA-Z]+\z/, message: 'Apenas Permite Letras' }
	end
