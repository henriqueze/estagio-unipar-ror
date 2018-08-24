class Backoffice::PaymentTypesController < BackofficeController
	before_action :set_payment_type, only: [:edit, :update]

	def index
		@q = PaymentType.ransack(params[:q])
		@payment_types = @q.result.page(params[:page]).per(6)
		@q.build_condition if @q.conditions.empty?

		respond_to do |format|
			format.html
			format.pdf {@q.result}
		end
	end

	#before_action :authenticate_system_user! verificar depois porque não está passando o sql correto
	def new
		@payment_type = PaymentType.new
	end

	def create
		@payment_type = PaymentType.new(params_payment_type)
		if @payment_type.save
			redirect_to backoffice_payment_types_path,
			notice: "Pagamento #{@payment_type.description} cadastrado com Sucesso"
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @payment_type.update(params_payment_type)
			redirect_to backoffice_payment_types_path,
			notice: "Pagamento #{@payment_type.description} atualizado com Sucesso"
		else
			render :edit
		end
	end

	private

	def set_payment_type
		@payment_type = PaymentType.find(params[:id])
	end

	def params_payment_type
		params.require(:payment_type).permit(:kind, :description, :interest_rates, :max_parcel)
	end
end


