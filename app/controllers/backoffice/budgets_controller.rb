class Backoffice::BudgetsController < BackofficeController
	before_action :set_budget, only: [:edit, :update, :show]

	def index
		@budgets = Budget.all
	end

	#before_action :authenticate_system_user! verificar depois porque não está passando o sql correto
	def new
		@budget = Budget.new
	end

	def create
		@budget = Budget.new(params_budget)
		if @budget.save
			redirect_to backoffice_budgets_path,
			notice: "Orçamento #{@budget.id} Cadastrado com Sucesso"
			@budget.atualiza_estoque_diminui
			@budget.atualiza_estoque_reservado_aumenta
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @budget.update(params_budget)
			redirect_to backoffice_budgets_path,
			notice: "Orçamento #{@budget.id} Atualizado com Sucesso"
		else
			render :edit
		end
	end

	private

	def set_budget
		@budget = Budget.find(params[:id])
	end

	def params_budget
		params.require(:budget).permit(:kind, :note, :date, :expiration_date,
			:total_value, :state, :person_id,
			 item_budgets_attributes: [:id, :amount, :value, :product_id, :budget_id])
	end
end
