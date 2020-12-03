class OwnersController < ApplicationController
    before_action :set_owner
    has_one_attached :photo
   def dash
       @clinics = Clinic.all
       @markers = @clinics.geocoded.map do |clinic|
         {
           lat: clinic.latitude,
           lng: clinic.longitude,
           infoWindow: render_to_string(partial: "info_window", locals: { clinic: clinic }),
           image_url: ENV['CLOUDINARY_URL']
           }
       end
   end

   def show

   end

   private

   def user_params
       params.require(:owner).permit(:first_name,:last_name,:location,:phone_number, :photo)
   end
   
   def set_owner
       @owner = current_user
       
   end
end