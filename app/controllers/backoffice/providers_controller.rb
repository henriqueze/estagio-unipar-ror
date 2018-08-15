class Backoffice::ProvidersController < BackofficeController
	before_action :set_provider, only: [:edit, :update, :show]


	def index
		@providers = Provider.all
	end

	#before_action :authenticate_system_user! verificar depois porque não está passando o sql correto
	def new
		@provider = Provider.new
	end

	def create
		@provider = Provider.new(params_provider)
		if @provider.save
			redirect_to backoffice_providers_path,
			notice: "Fornecedor #{@provider.name} cadastrada com Sucesso"
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @provider.update(params_provider)
			redirect_to backoffice_providers_path,
			notice: "Fornecedor #{@provider.name} atualizada com Sucesso"
		else
			render :edit
		end
	end

	private

	def set_provider
		@provider = Provider.find(params[:id])
	end

	def params_provider
		params.require(:provider).permit(:name, :provider_rasocial, :provider_ie,
			:provider_cnpj, :provider_tel1, :provider_tel2, :address, :address_number,
			:address_complement, :address_bairro, :address_city, :address_state, :address_zip)
	end
end


