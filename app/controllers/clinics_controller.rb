class ClinicsController < ApplicationController
  before_action :set_clinic


    def new

    end

    def create

    end

    def dash

    end

    def show
      @clinic = Clinic.find(params[:id])

      authorize @clinic

    end

    def edit

      authorize @clinic
    end

    def update
      @clinic.update(clinic_params)
      redirect_to clinic_path(@clinic), notice: "Your sucessfully updated your details"
    end

    private

    def set_clinic

       if current_user.type == "Clinic"
         @clinic = current_user
       else
        @clinic = Clinic.find(params[:id])
       end

    end

    def clinic_params
      params.require(:clinic).permit(:name,:location,:phone_number,:email, :photo)

    end
end
