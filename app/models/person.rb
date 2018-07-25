class Person < ApplicationRecord
	String kind:[:Fisica, :Juridica]

	has_many :sale
	has_many :purchase
	has_many :budget
end
