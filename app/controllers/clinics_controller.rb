class ClinicsController < ApplicationController
  before_action :set_clinic
    def index
      @clinics = Clinic.all
      @markers = @clinics.geocoded.map do |clinic|
        {
          lat: clinic.latitude,
          lng: clinic.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { clinic: clinic }),
          #image_url: :CLOUDINARY_URL
          }
      end
    end

    def new

    end

    def create
        
    end

    def dash

    end

    def show

    end
    private
    def set_clinic
      @clinic = current_clinic
    end
end
