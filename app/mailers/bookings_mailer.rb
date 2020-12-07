class BookingsMailer < ApplicationMailer
    default from: "me@vetbook497.com"
    def confirmed_booking
        @booking = params[:booking]
        mail(to: @booking.pet.user.email, subject: "Booking confirmed")
    end

    def booking_recieved
        @booking = params[:booking]
        mail(to: @booking.vet.user.email, subject: "Booking recieved")
    end
end
