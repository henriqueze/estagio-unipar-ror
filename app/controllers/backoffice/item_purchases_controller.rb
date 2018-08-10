class Backoffice::ItemPurchasesController < BackofficeController
	before_action :set_item_purchase, only: [:show, :edit, :update, :destroy]

	def index
		@item_purchases = ItemPurchase.all
	end

	#before_action :authenticate_system_user! verificar depois porque não está passando o sql correto
	def new
		@item_purchase = ItemPurchase.new
		@item_purchase.product.build
	end

	def create
		@item_purchase = ItemPurchase.new(params_item_purchase)
		if @item_purchase.save
			redirect_to @item_purchase,
			notice: "Item #{@item_purchase.id} Adicionado com Sucesso"
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @item_purchase.update(params_item_purchase)
			redirect_to @item_purchase,
			notice: "Item #{@item_purchase.id} atualizado com Sucesso"
		else
			render :edit
		end
	end

	def destroy
		@item_purchase.destroy
	end

	private

	def set_item_purchase
		@item_purchase = ItemPurchase.find(params[:id])
	end

	def params_item_purchase
		params.require(:item_purchase).permit(:amount, :value, :product_id, :purchase_id)
	end
end

