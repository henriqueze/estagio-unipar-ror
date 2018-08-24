class Backoffice::CategoriesController < BackofficeController
	before_action :set_category, only: [:edit, :update]

	def index
		@q = Category.ransack(params[:q])
		@categories = @q.result.page(params[:page]).per(6)

		respond_to do |format|
			format.html
			format.pdf {@q.result}
		end
	end

	#before_action :authenticate_system_user! verificar depois porque não está passando o sql correto
	def new
		@category = Category.new
	end

	def create
		@category = Category.new(params_category)
		if @category.save
			redirect_to backoffice_categories_path,
			notice: "Categoria (#{@category.description}) cadastrada com Sucesso"
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @category.update(params_category)
			redirect_to backoffice_categories_path,
			notice: "Categoria (#{@category.description}) atualizada com Sucesso"
		else
			render :edit
		end
	end

	private

	def set_category
		@category = Category.find(params[:id])
	end

	def params_category
		params.require(:category).permit(:description)
	end
end
