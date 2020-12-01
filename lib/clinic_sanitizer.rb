class Clinic::ParameterSanitizer < Devise::ParameterSanitizer
    def initialize(*)
      super
      permit(:sign_up, keys: [:name, :address, :phone_number,:email, :owner_name])
    end
  end