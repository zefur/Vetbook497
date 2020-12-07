# Preview all emails at http://localhost:3000/rails/mailers/bookings_mailer
class BookingsMailerPreview < ActionMailer::Preview
    def confirmed_booking
    BookingsMailer.with(booking: Booking.first).confirmed_booking
    end
    def booking_recieved
        BookingsMailer.with(booking: Booking.first).booking_recieved
    end
end
