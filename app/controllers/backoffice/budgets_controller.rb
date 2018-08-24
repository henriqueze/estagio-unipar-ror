class Backoffice::BudgetsController < BackofficeController
	before_action :set_budget, only: [:edit, :update, :show]

	def index
		@q = Budget.ransack(params[:q])
		@budgets = @q.result.page(params[:page]).per(6)
		@q.build_condition if @q.conditions.empty?

		respond_to do |format|
			format.html
			format.pdf {@q.result}
		end
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
