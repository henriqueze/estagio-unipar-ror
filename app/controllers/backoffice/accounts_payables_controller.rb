class Backoffice::AccountsPayablesController < BackofficeController
	before_action :set_accounts_payable, only: [:edit, :update, :show]

	def index
		@q = AccountsPayable.ransack(params[:q])
		@accounts_payables = @q.result.page(params[:page]).per(10)
		@q.build_condition if @q.conditions.empty?

		respond_to do |format|
			format.html
			format.pdf {@q.result}
		end
	end

	#before_action :authenticate_system_user! verificar depois porque não está passando o sql correto
	def new
		@accounts_payable = AccountsPayable.new
	end

	def create
		@accounts_payable = AccountsPayable.new(params_accounts_payable)
		if @accounts_payable.save
			redirect_to backoffice_accounts_payables_path,
			notice: "Conta a Pagar #{@accounts_payable.id} Registrada com Sucesso"
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @accounts_payable.update(params_accounts_payable)
			redirect_to backoffice_accounts_payables_path,
			notice: "Conta a Pagar #{@accounts_payable.id} Atualizada com Sucesso"
		else
			render :edit
		end
	end

	private

	def set_accounts_payable
		@accounts_payable = AccountsPayable.find(params[:id])
	end

	def params_accounts_payable
		params.require(:accounts_payable).permit(:state, :description, :document_kind,
			:document_number, :issue_date, :expiration_date,
			:payment_date, :total_parcels, :current_parcel, :payable_value,
			:additions_value, :discount_value, :total_value, :paid_value,
			:voucher_image, :purchase_id, :provider_id)
	end
end


