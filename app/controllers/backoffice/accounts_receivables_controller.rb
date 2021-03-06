class Backoffice::AccountsReceivablesController < BackofficeController
	before_action :set_accounts_receivable, only: [:edit, :update, :show]

	def index
		@q = AccountsReceivable.ransack(params[:q])
		@accounts_receivables = @q.result.page(params[:page]).per(10)
		@q.build_condition if @q.conditions.empty?

		respond_to do |format|
			format.html
			format.pdf {@q.result}
		end
	end

	#before_action :authenticate_system_user! verificar depois porque não está passando o sql correto
	def new
		@accounts_receivable = AccountsReceivable.new
	end

	def create
		@accounts_receivable = AccountsReceivable.new(params_accounts_receivable)
		if @accounts_receivable.save
			redirect_to backoffice_accounts_receivables_path,
			notice: "Conta a Receber #{@accounts_receivable.id} Registrada com Sucesso"
			@accounts_receivable.cria_parcelas
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @accounts_receivable.update(params_accounts_receivable)
			redirect_to backoffice_accounts_receivables_path,
			notice: "Conta a Receber #{@accounts_receivable.id} Atualizada com Sucesso"
		else
			render :edit
		end
	end

	private

	def set_accounts_receivable
		@accounts_receivable = AccountsReceivable.find(params[:id])
	end

	def params_accounts_receivable
		params.require(:accounts_receivable).permit(:state, :description, :kind,
			:issue_date, :expiration_date, :received_date, :total_value,
			:received_value, :remaining_value, :total_parcels, :parcel,
			:sale_id, :person_id)
	end
end


