class Backoffice::PeopleController < BackofficeController
  before_action :set_person, only: [:edit, :update, :show]

	def index
		@people = Person.all
	end

	#before_action :authenticate_system_user! verificar depois porque não está passando o sql correto
	def new
		@person = Person.new
	end

	def create
		@person = Person.new(params_person)
		if @person.save
			redirect_to backoffice_people_path,
				 notice: "Pessoa (#{@person_name}) cadastrada com Sucesso"
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @person.update(params_person)
			redirect_to backoffice_people_path,
				 notice: "Pessoa (#{@person_name}) atualizada com Sucesso"
		else
			render :edit
		end
	end

	private

		def set_person
			@person = Person.find(params[:id])
		end

		def params_person
			params.require(:person).permit(:kind, :name, :company_name, :person_rg,
						 :personC_ie, :person_cpf, :personC_cnpj, :personC_provider,
						 :address, :address_number, :address_complement, :address_bairro,
						 :address_zip, :address_city, :address_state, :person_tel1,
						 :person_tel2, :person_email, :person_obs )
		end
end

