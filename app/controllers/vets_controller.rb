class VetsController < ApplicationController
    def new
        @vet = Vet.new
    end

    def create
        @vet =Vet.new(vet_params)
        @vet.clinic = current_clinic
        if @vet.save!
            redirect_to @vet
        else
            flash: @vet.errors.full_messages
            render :new
        end
    end

    private
    
    def set_params
        params.require(:vet).permit(:first_name, :last_name, :speciality, :bio, :photo)
    end

    def set_default
        @vet = Vet.find(params[:id])
    end

    
end
