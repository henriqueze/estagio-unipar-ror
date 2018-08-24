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
	"Suspensão",
	"Porta",
	"Capo",
	"Tampa Traseira",
	"Paralama",
	"Emblema",
	"Calota"]

	categories.each do |category|
		Category.create!(description: category)
	end

	puts "Cadastrado com Sucesso"

##################Usuario##################

puts "Cadastrando Administrador"

MasterUser.create!(
	email: "henrique.ze@live.com",
	password: "123456",
	password_confirmation: "123456")

puts "Administrador Cadastrado com Sucesso"

##################Pessoa##################
puts "Cadastrando Pessoa"

Person.create!(
	kind: "Fisica",
	name: "Henrique Poncetti Zegalo",
	person_rg: "107814159",
	person_cpf: "08798865951",
	address: "Rua Campinas",
	address_number: "423",
	address_complement: "Casa",
	address_bairro: "Zona 04",
	address_zip: "87210012",
	address_city: "Cianorte",
	address_state: "PR",
	person_tel1: "44999266459",
	person_tel2: "4436318292",
	person_email: "henrique.ze@live.com",
	person_obs: "nada a declarar" )

puts "Pessoa Cadastrada"

##################Produtos##################
puts "Cadastrando Produtos"

Product.create!(
	product_code: "00129874",
	description: "Porta Dianteira Direita",
	purchase_price: "199.93",
	sale_price: "332.15",
	profit_margin: "",
	stock: "76",
	stock_reserved: "0",
	category_id:"9")

puts "Produto Cadastrado"


