class ApplicationController < ActionController::Base
	layout :layout_by_resource

	protected

	def layout_by_resource
		if devise_controller? && resource_name == :master_user
			"backoffice_devise"
		else
			"application"
		end
	end

	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
		devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
		devise_parameter_sanitizer.permit :account_update, keys: added_attrs
		devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
	end

end
