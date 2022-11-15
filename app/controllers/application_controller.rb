class ApplicationController < ActionController::Base
  before_action :confirgure_permitted_paramaters, if: :devise_controller?
  protected
  def confirgure_permitted_paramaters
    devise_parameter_sanitizer.permit(:update, keys:[:first_name, :last_name,:mobile_number,:state, :address, :pin_code,:email,:role])
    devise_parameter_sanitizer.permit(:sign_up, keys:[:first_name, :last_name,:mobile_number, :state, :address, :pin_code,:email,:role])
  end
end
