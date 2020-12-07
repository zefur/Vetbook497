# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Owner.create(email: "jdhall@live.co.uk", name: "James", location: "England", phone_number:"12398765432", password: "password")
Clinic.create(email: "me@clinic.co.uk", name: "Jammy's Clinic",location: "53 Green Lane, MANCHESTER, M81 8WY, England",owner_name: "James Hall",phone_number: "098765432109", password: "password")
Clinic.create(email: "me2@clinic.co.uk", name: "Oxford's Clinic",location: "61 King Street, OXFORD,OX86 4CM, England",owner_name: "James Hall",phone_number: "098765432109", password: "password")
Clinic.create(email: "me3@clinic.co.uk", name: "Deanshanger's Clinic",location: "Deanshanger Memorial Community Cent, Little London, Milton Keynes, MK19 6HT, England",owner_name: "James Hall",phone_number: "098765432109", password: "password")
Clinic.create(email: "me4@clinic.co.uk", name: "Starline's Clinic",location: "16a, Little London, Milton Keynes, MK19 6HT, England",owner_name: "James Hall",phone_number: "098765432109", password: "password")


3.times do 
    Pet.create(name:Faker::Name.first_name,gender: 1, species:"cat",user_id: 1)
end

3.times do 
    Vet.create(first_name:Faker::Name.first_name, speciality:"cardio", bio: Faker::Quote.famous_last_words)
end

