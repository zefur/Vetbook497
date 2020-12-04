class BookingsController < ApplicationController
    before_action :set_default
    def new
        @booking = Booking.new
    end

    def create
        @booking = Booking.new(booking_params)
    end

    def edit

    end

    def update

    end

    def destroy

    end

    private
    def booking_params
        params.require(:booking).permit(:date, :time, :reason_for_visit)
    end
    def set_default
        @clinic= Clinic.find(params[:clinic_id])
        @user = current_user
    end
end
