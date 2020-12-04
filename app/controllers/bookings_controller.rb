class BookingsController < ApplicationController
    before_action :set_default
    def new
        @booking = Booking.new
        @vet = Vet.find(params[:vet])
    end

    def create
        @booking = Booking.new(booking_params)

        if @booking.save
          redirect_to owners_dash_path(@user), notice: "Your booking has been sent, please wait for confirmation"
        else
          render :new
        end
    end

    def edit

    end

    def update

    end

    def destroy

    end

    private
    def booking_params
        params.require(:booking).permit(:date, :time, :reason_for_visit, :vet_id, :pet_id)
    end
    def set_default
        @clinic= Clinic.find(params[:clinic_id])
        @user = current_user
    end
end
