class BackofficeController < ApplicationController
		before_action :authenticate_master_user! #verificar para colocar o system user

		layout "backoffice"

	end

