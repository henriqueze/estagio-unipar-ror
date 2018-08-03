class Backoffice::ItemSalesController < BackofficeController
	before_action :set_item_sale, only: [:show, :edit, :update, :destroy]

	def index
		@item_sales = ItemSale.all
	end

	#before_action :authenticate_system_user! verificar depois porque não está passando o sql correto
	def new
		@item_sale = ItemSale.new
	end

	def create
		@item_sale = ItemSale.new(params_item_sale)
		if @item_sale.save
			redirect_to @item_sale,
			notice: "Item #{@item_sale.id} Adicionado com Sucesso"
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @item_sale.update(params_item_sale)
			redirect_to @item_sale,
			notice: "Item #{@item_sale.id} atualizado com Sucesso"
		else
			render :edit
		end
	end

	def destroy
		@item_sale.destroy
		redirect_to backoffice_item_sales_path
	end

	private

	def set_item_sale
		@item_sale = ItemSale.find(params[:id])
	end

	def params_item_sale
		params.require(:item_sale).permit(:amount, :value, :total_value, :product_id, :sale_id)
	end
end
