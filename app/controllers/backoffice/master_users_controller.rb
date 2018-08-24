class Backoffice::MasterUsersController < BackofficeController
	before_action :set_masterUser, only: [:edit, :update]

	def index
		@q = MasterUser.ransack(params[:q])
		@master_users = @q.result.page(params[:page]).per(6)
		@q.build_condition if @q.conditions.empty?

		respond_to do |format|
			format.html
			format.pdf {@q.result}
		end
	end

	def new
		@master_user = MasterUser.new
	end

	def create
		@master_user = MasterUser.new(params_masterUser)
		if @master_user.save
			redirect_to backoffice_master_users_path,
			notice: "Usuario (#{@master_user.email}) cadastrado com Sucesso"
		else
			render :new
		end
	end

	def edit
	end

	def update
		passwd = params[:master_user][:password]
		passwd_confirmation = params[:master_user][:password_confirmation]

		if passwd.blank? && passwd_confirmation.blank?
			params[:master_user].delete(:password)
			params[:master_user].delete(:password_confirmation)
		end

		if @master_user.update(params_masterUser)
			redirect_to backoffice_master_users_path,
			notice: "Usuario (#{@master_user.email}) atualizado com Sucesso"
		else
			render :edit
		end
	end

	private

	def set_masterUser
		@master_user = MasterUser.find(params[:id])
	end

	def params_masterUser
		params.require(:master_user).permit(:email, :password, :password_confirmation)
	end

end
