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

  validates :description, :product_code, :sale_price, presence: true
  validates :product_code, uniqueness: {case_sensitive: false} , length: { maximum: 20}
  validates_numericality_of :purchase_price, :sale_price, length: { maximum: 10}
  validates :stock, numericality: { only_integer: true,
   message: "Apenas Inteiros" }, length: { maximum: 5}
  validates :sale_price, :numericality =>{:greater_than_or_equal_to => :purchase_price},
   length: { maximum: 13}
  #validates :Preco_Custo, allow_nil: true
end
