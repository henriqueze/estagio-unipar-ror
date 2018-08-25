class Backoffice::PurchasesController < BackofficeController
	before_action :set_purchase, only: [:edit, :update, :show]

	def index
		@q = Purchase.ransack(params[:q])
		@purchases = @q.result.page(params[:page]).per(6)
		@q.build_condition if @q.conditions.empty?

		respond_to do |format|
			format.html
			format.pdf {@q.result}
		end
	end

	#before_action :authenticate_system_user! verificar depois porque não está passando o sql correto
	def new
		@purchase = Purchase.new
	end

	def create
		@purchase = Purchase.new(params_purchase)
		if @purchase.save
			redirect_to backoffice_purchases_path,
			notice: "Compra #{@purchase.id} Cadastrada com Sucesso"
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
			notice: "Compra #{@purchase.id} Atualizada com Sucesso"
		else
			render :edit
		end
	end

	private

	def set_purchase
		@purchase = Purchase.find(params[:id])
	end

	def params_purchase
		params.require(:purchase).permit(:date, :total_value, :freight_value, :provider_id,
			item_purchases_attributes: [:id, :amount, :value, :product_id, :purchase_id])
	end
end
