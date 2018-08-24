class Backoffice::DashboardController < BackofficeController

	def index
		@sales = Sale.all
	end
end
