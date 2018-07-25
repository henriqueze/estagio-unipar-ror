class Product < ApplicationRecord
  belongs_to :category
  #venda
  has_many :item_sale
  has_many :sale, through: :item_sale
  #orçamento
  has_many :item_budget
  has_many :budget, through: :item_budget
  #compra
  has_many :item_purchase
  has_many :purchase, through: :item_purchase
end
