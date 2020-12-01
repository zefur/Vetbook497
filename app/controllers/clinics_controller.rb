class ClinicsController < ApplicationController
  before_action :set_clinic
    def index
  
    
    end

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
      @clinic = current_clinic
    end
end
