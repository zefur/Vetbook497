class DiagnosisController < ApplicationController
    before_action :set_default
    # def new
    #     @vaccination = Vaccination.new
    #     @owner = User.find(params[:owner_id])
    #     @pet = Pet.find(params[:pet_id])
    # end

    # def create
    #     @health_record = HealthRecord.new(health_params)

    #     if @health_record.save
    #       redirect_to owner_pet_path(@owner,@pet)
    #     else
    #         render :new
    #     end
    # end

    # def show
    #     @health_record = HealthRecord.find(params[:id])
    # end

    def edit
        @diagnosis = Diagnosis.find(params[:id])
    end

    def update
        @diagnosis = Diagnosis.find(params[:id])
        if @diagnosis.update(diagnosis_params)
            redirect_to owner_pet_path(@owner, @pet)
        else
            render :edit
        end
    end



    private

    def diagnosis_params
        params.require(:diagnosis).permit(:diagnosis_date,:diagnosis,:treatment,:vaccination_date,:vaccination_type,:pet_id,:is_vaccinated, :type, :document)
    end

    def set_default
        @owner = Owner.find(params[:owner_id])
        @pet = Pet.find(params[:pet_id])

    end
end