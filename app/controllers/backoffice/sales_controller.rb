class Backoffice::SalesController < BackofficeController
	before_action :set_sale, only: [:edit, :update, :show, :destroy]

	def index
		@q = Sale.ransack(params[:q])
		@sales = @q.result.page(params[:page]).per(6)
		@q.build_condition if @q.conditions.empty?

		respond_to do |format|
			format.html
			format.pdf {@q.result}
		end
	end

	#before_action :authenticate_system_user!
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
		#não funciona aqui, tentar ver algum jeito de fazer no model
		 #para validar antes de entrar no modo de edição
		 if @sale.state == 'Finalizada'
		 	redirect_to backoffice_sales_path,
		 	notice: "Venda #{@sale.id} não pode ser Alterada"
		 else
		 	if @sale.update(params_sale)
		 		redirect_to backoffice_sales_path,
		 		notice: "Venda #{@sale.id} atualizado com Sucesso"
		 	else
		 		render :edit
		 	end
		 end
		end


		private

		def set_sale
			@sale = Sale.find(params[:id])
		end

		def params_sale
			params.require(:sale).permit(:date, :total_value, :discount_value, :state,
				:person_id, :payment_type_id,
				item_sales_attributes: [:id, :amount, :value, :total_value, :product_id, :sale_id])
		end

	end

