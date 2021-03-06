class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :authenticate_user!

	def after_sign_in_path_for(resource)
		user_path(resource.id)
	end

	def after_sign_out_path_for(resource_or_scope)
		root_path
	end





	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :postcode, :prefecture_code, :address_city, :address_street, :address_building, :latitude, :longitude])
	end

end
