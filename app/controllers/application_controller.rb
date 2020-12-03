class ApplicationController < ActionController::Base


 before_action :authenticate_user!

def after_sign_in_path_for(resource)
puts resource
  resource.class == Clinic ? clinics_dash_path : owners_dash_path
end


  before_action :configure_permitted_parameters, if: :devise_controller?



  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:type, :name, :address, :phone_number, :owner_name, :location])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:location, :phone_number])
  end

end
