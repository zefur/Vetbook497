# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
10.times do
    sleep(2)
    Clinic.create(name:Faker::Company.name,location:Faker::Address.full_address)
end



User.create(email: "jdhall@live.co.uk", name: "James", location: "England", phone_number:"12398765432", password: "password")
Clinic.create(email: "me@clinic.co.uk", name: "Jammy's Clinic",location: "England",owner_name: "James Hall",phone_number: "098765432109", password: "password")


3.times do 
    Pet.create(name:Faker::Name.first_name,gender: 1, species:"cat",user_id: 1)
end

3.times do 
    Vet.create(first_name:Faker::Name.first_name, speciality:"cardio", bio: Faker::Quote.famous_last_words)
end

