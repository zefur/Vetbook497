class VetsController < ApplicationController
    before_action :set_default
    
    def new
        @vet = Vet.new
    end

    def create
        @vet = Vet.new(vet_params)
        @vet.user = current_user
        if @vet.save!
            redirect_to clinic_path(@clinic)
        else
            render :new
        end
    end

    private
    
    def vet_params
        params.require(:vet).permit(:first_name, :last_name, :speciality, :bio, :photo)
    end

    def set_default
        @clinic = current_user
    end

    
end
