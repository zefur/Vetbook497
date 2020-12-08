class VetsController < ApplicationController
    before_action :set_default

    def new
        @vet = Vet.new
    end

    def create
        @vet = Vet.new(vet_params)
        authorize @vet
        @vet.user = current_user
        if @vet.save!
            redirect_to clinic_path(@clinic)
        else
            render :new
        end
    end

    def edit


        authorize @vet
    end

    def update
        authorize @vet
        if @vet.update(vet_params)
            redirect_to clinic_path(@clinic), notice: "Vet has been updated"

        else
            render :edit
        end
    end


    def delete_photo
        @vet.photo.purge
    end

    private


    def vet_params
        params.require(:vet).permit(:first_name, :last_name, :speciality, :bio, :photo)
    end

    def destroy
        authorize @vet
        @vet.destroy
        redirect_to vets_path, notice: 'Successfully deleted'
    end

    private
    def set_default
        @clinic = current_user
        @vet = Vet.find(params[:id])
    end


end
