class ClinicsController < ApplicationController
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

    def show

    end

    def new

    end

    def create
        
    end
end
