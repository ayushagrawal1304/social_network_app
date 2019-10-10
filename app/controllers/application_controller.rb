class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  PER_PAGE = 10

  def after_sign_in_path_for(resource)
  users_dashboards_index_path #your path
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up){ |u| u.permit(:name, :email, :password, :first_name, :password_confirmation, :last_name, :mobile_no)}
      devise_parameter_sanitizer.permit(:account_update){ |u| u.permit(:name, :email, :password, :current_password, :first_name, :password_confirmation, :last_name, :mobile_no, :image)}
    end
end
