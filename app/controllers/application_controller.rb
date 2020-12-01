class ApplicationController < ActionController::Base
  require 'clinic_sanitizer'
  before_action :authenticate_user!
  def devise_parameter_sanitizer
    if resource_class == Clinic
      Clinic::ParameterSanitizer.new(Clinic, :clinic, params)
    else
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name,:location,:phone_number])
    end
  end
end
