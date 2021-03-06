class BookingsController < ApplicationController
    before_action :set_default, except: :destroy
    def new
        @booking = Booking.new
        @vet = Vet.find(params[:vet])
    end

    def create
        @booking = Booking.new(booking_params)

        if @booking.save
            BookingsMailer.with(booking: @booking).booking_recieved.deliver_later
          redirect_to owners_dash_path(@user), notice: "Your booking has been sent, please wait for confirmation"
        else
          render :new
        end
    end

    def edit

    end

    def update

    end

    def toggle_accepted
        @booking = Booking.find(params[:id])
        if !@booking.accepted
            @booking.accepted = true
            @booking.save
            BookingsMailer.with(booking: @booking).confirmed_booking.deliver_later
        end
        redirect_to clinics_dash_path
    end

    def archive_booking
        @booking = Booking.find(params[:id])
        @booking.archived = true
        @booking.save
        redirect_to clinics_dash_path
    end

    def destroy
        @booking= Booking.find(params[:id])
        @booking.destroy
        redirect_back(fallback_location: root_path)
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
