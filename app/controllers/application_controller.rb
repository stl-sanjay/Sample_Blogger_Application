class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  ## before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

    protected
      # Added parameters before make entry into databse
      def configure_permitted_parameters
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:firstname, :lastname, :birthday, :address, :photo, :email, :password, :password_confirmation, :current_password) }
      end
end