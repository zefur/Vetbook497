class OwnersController < ApplicationController

    before_action :set_owner
    before_action :authenticate_user!


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
    @owner = User.find(params[:id])
    authorize @owner
   end

   def edit
    #@owner.photo.attach(params[:photo])
    @owner = User.find(params[:id])
    authorize @owner
   end


   def update
    @pet = Pet.new
    if @owner.update(owner_params)
        redirect_to owners_dash_path(@owner), notice: 'Successfully updated'
    else
        render :edit
    end
   end
   def delete_photo
    @owner.photo.purge
   end



   private

   def owner_params
       params.require(:owner).permit(:first_name,:last_name,:location,:phone_number,:email, :photo)
   end

   def set_owner
       @owner = current_user

   end
end
