class Product < ApplicationRecord
  belongs_to :category
  #venda
  has_many :item_sales, dependent: :destroy
  has_many :sales, through: :item_sales
  #orçamento
  has_many :item_budgets, dependent: :destroy
  has_many :budgets, through: :item_budgets
  #compra
  has_many :item_purchases, dependent: :destroy
  has_many :purchases, through: :item_purchases

  validates :description, :product_code, :sale_price, presence: true
  validates :product_code, uniqueness: {case_sensitive: false} , length: { maximum: 20}

  validates :stock, numericality: { only_integer: true,
   message: "Apenas Inteiros" }, length: { maximum: 5}, numericality: { greater_than_or_equal_to: 0 }
  validates :sale_price, :numericality =>{:greater_than_or_equal_to => :purchase_price},
   length: { maximum: 13}
  #validates :Preco_Custo, allow_nil: true
  #validates_numericality_of :purchase_price, :sale_price, length: { maximum: 10}, only_integer: false

  before_save :calcula_margem_lucro

  def calcula_margem_lucro
    valor1 = self.sale_price - self.purchase_price
    valor2 = valor1 * 100
    self.profit_margin = valor2 / self.purchase_price
  end

end
