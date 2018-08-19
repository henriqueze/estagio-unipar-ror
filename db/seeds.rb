# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cadastrando Categorias"

categories = ["Farol",
	"Parachoque",
	"Lanterna Traseira",
	"Lanterna Dianteira",
	"Acessório",
	"Acabamento",
	"Mecanica",
	"Suspensão"]

	categories.each do |category|
		Category.create!(description: category)
	end

	puts "Cadastrado com Sucesso"


#######################

puts "Cadastrando Administrador"

MasterUser.create!(email: "henrique.ze@live.com",
	password: "123456",
	password_confirmation: "123456")

puts "Administrador Cadastrado com Sucesso"
