class HealthRecordsController < ApplicationController
before_action :set_default
    def new
        @health_record = HealthRecord.new
        @owner = User.find(params[:owner_id])
        @pet = Pet.find(params[:pet_id])
    end
    
    def create
        @health_record = HealthRecord.new(health_params)

        if @health_record.save
             notice: "Record created"
        else
            render :new
        end
    end


    private

    def health_params
        params.require(:health_record).permit(:diagnosis_date,:diagnosis,:treatment,:vaccination_date,:vaccination_type,:pet_id,:is_vaccinated)
    end

    def set_default
        @owner = Owner.find(params[:owner_id])
        @pet = Pet.find(params[:pet_id])
        @clinic = Clinic.find(params[:clinic_id])
    end

end
