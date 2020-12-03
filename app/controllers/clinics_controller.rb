class ClinicsController < ApplicationController
  before_action :set_clinic
  has_one_attached :photo
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

      @clinic = current_user

    end
end
