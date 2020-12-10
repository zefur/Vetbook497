class VaccinationMailer < ApplicationMailer
    default from: 'honey@clinic.com'
    def vaccination_remider
        @vaccination = params[:vaccination]
        mail(to: @vaccination.pet.user.email, subject: "Vaccination remider")
    end
end
