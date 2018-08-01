class Backoffice::AccountsPayablesController < BackofficeController
	before_action :set_accounts_payable, only: [:edit, :update, :show]

	def index
		@accounts_payables = AccountsPayable.all
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
		params.require(:accounts_payable).permit(:state, :description, :kind,
						 :issue_date, :expiration_date, :received_date, :total_value,
						 :received_value, :remaining_value, :total_parcels, :parcel,
						 :sales_id, :payment_type_id, :system_user_id)
	end
end


