class Backoffice::ItemBudgetsController < BackofficeController
	before_action :set_item_budget, only: [:show, :edit, :update, :destroy]

	def index
		@item_budgets = ItemBudget.all
	end

	#before_action :authenticate_system_user! verificar depois porque não está passando o sql correto
	def new
		@item_budget = ItemBudget.new
		@item_budget.product.build
	end

	def create
		@item_budget = ItemBudget.new(params_item_budget)
		if @item_budget.save
			redirect_to @item_budget,
			notice: "Item #{@item_budget.id} Adicionado com Sucesso"
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @item_budget.update(params_item_budget)
			redirect_to @item_budget,
			notice: "Item #{@item_budget.id} atualizado com Sucesso"
		else
			render :edit
		end
	end

	def destroy
		@item_budget.destroy
	end

	private

	def set_item_budget
		@item_budget = ItemBudget.find(params[:id])
	end

	def params_item_budget
		params.require(:item_budget).permit(:amount, :value, :product_id, :budget_id)
	end
end

end
