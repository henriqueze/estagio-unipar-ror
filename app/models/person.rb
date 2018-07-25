class Person < ApplicationRecord
	String kind:[:Fisica, :Juridica]

	has_many :sales
	has_many :purchases
	has_many :budget
end
