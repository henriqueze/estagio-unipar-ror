class Backoffice::ProductsController < BackofficeController
	before_action :set_product, only: [:edit, :update]

	def index
		@products = Product.all
	end

	#before_action :authenticate_system_user! verificar depois porque não está passando o sql correto
	def new
		@product = Product.new
	end

	def create
		@product = Product.new(params_product)
		if @product.save
			redirect_to backoffice_products_path,
			notice: "Produto #{@product.description} cadastrado com Sucesso"
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @product.update(params_product)
			redirect_to backoffice_products_path,
			notice: "Produto #{@product.description} atualizado com Sucesso"
		else
			render :edit
		end
	end

	private

	def set_product
		@product = Product.find(params[:id])
	end

	def params_product
		params.require(:product).permit(:product_code, :description, :purchase_price,
								:sale_price, :profit_margin, :stock, :stock_reserved, :category_id)
	end
end


