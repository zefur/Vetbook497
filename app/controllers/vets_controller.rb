class VetsController < ApplicationController
    before_action :set_default, except: [:new, :create]

    def new
        @vet = Vet.new
        @clinic = current_user
    end

    def create
        @vet = Vet.new(vet_params)
        @vet.user = current_user
        authorize @vet
        if @vet.save!
            redirect_to clinic_path(@vet.user)
        else
            render :new
        end
    end

    def edit
        @vet = Vet.find(params[:id])
        authorize @vet
    end

    def update
        @vet = Vet.find(params[:id])
        authorize @vet
        if @vet.update(vet_params)
            redirect_to clinic_path(@clinic), notice: "Vet has been updated"

        else
            render :edit
        end
    end

    def destroy 
        @vet = Vet.find(params[:id])  
        authorize @vet
        @vet.destroy
        redirect_to clinic_path(@clinic), notice: 'Successfully deleted'
    end

    def delete_photo
        @vet.photo.purge
    end

    private

    def vet_params
        params.require(:vet).permit(:first_name, :last_name, :speciality, :bio, :photo)
    end


    def set_default
        @clinic = Clinic.find(params[:clinic_id])   
    end


end
