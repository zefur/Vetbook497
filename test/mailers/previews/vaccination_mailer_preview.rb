# Preview all emails at http://localhost:3000/rails/mailers/vaccination_mailer
class VaccinationMailerPreview < ActionMailer::Preview
    def vaccination_remider
        VaccinationMailer.with(vaccination: Vaccination.first).vaccination_remider
    end
end
