class Backoffice::SalesController < BackofficeController
	before_action :set_sale, only: [:edit, :update, :show]

	def index
		@sales = Sale.all
	end

	#before_action :authenticate_system_user! verificar depois porque não está passando o sql correto
	def new
		@sale = Sale.new
	end

	def create
		@sale = Sale.new(params_sale)
		if @sale.save
			redirect_to backoffice_sales_path,
			notice: "Venda #{@sale.id} Realizada com Sucesso"
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @sale.update(params_sale)
			redirect_to backoffice_sales_path,
			notice: "Venda #{@sale.id} atualizado com Sucesso"
		else
			render :edit
		end
	end

	private

	def set_sale
		@sale = Sale.find(params[:id])
	end

	def params_sale
		params.require(:sale).permit(:date, :total_value, :discount_value, :state,
			:person_id, :payment_type_id,
			:product_attributes, :item_sale_attributes)
	end
end

