class Backoffice::PurchaseController < BackofficeController
	before_action :set_purchase, only: [:edit, :update, :show]

	def index
		@purchases = Purchase.all
	end

	#before_action :authenticate_system_user! verificar depois porque não está passando o sql correto
	def new
		@purchase = Purchase.new
	end

	def create
		@purchase = Purchase.new(params_purchase)
		if @purchase.save
			redirect_to backoffice_purchases_path,
			notice: "Compra #{@budget.id} Atualizada com Sucesso"
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @purchase.update(params_purchase)
			redirect_to backoffice_purchases_path,
			notice: "Compra #{@budget.id} Atualizada com Sucesso"
		else
			render :edit
		end
	end

	private

	def set_purchase
		@purchase = Purchase.find(params[:id])
	end

	def params_purchase
		params.require(:purchase).permit(:date, :total_value, :freight_value, :person_id)
	end
end
