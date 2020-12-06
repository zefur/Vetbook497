class ClinicsController < ApplicationController
  before_action :set_clinic

   

    def new

    end

    def create

    end

    def dash

    end

    def show

    end
    private
    def set_clinic

      if current_user.type == "Clinic"
        @clinic = current_user
      else
        @clinic = Clinic.find(params[:id])
      end

    end
end
