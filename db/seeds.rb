# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Owner.create(email: "jdhall@live.co.uk", name: "James", location: "England", phone_number:"12398765432", password: "password")
Clinic.create(email: "me@clinic.co.uk", name: "Jammy's Clinic",location: "England",owner_name: "James Hall",phone_number: "098765432109", password: "password")

Owner.create(email: "mr.chan@hotmail.com", name: "Mr. CHAN", location: "Flat 25, 12/F, Acacia Building,150 Kennedy Road,WAN CHAI,HONG KONG", phone_number:"85229212222", password: "password")

Clinic.create(email: "lovepet@clinic.co.uk", name: "Love pet Clinic",location: "Flat D, 6/F, Golden Industrial Center, Block 4,182-190 Tai Lin Pai Road, Kwai Chung,NEW TERRITORIES,HONG KONG",owner_name: "James Hall",phone_number: "098765432109", password: "password")


3.times do 
    Pet.create(name:Faker::Name.first_name,gender: 1, species:"cat",user_id: 1)
end

3.times do 
    Vet.create(first_name:Faker::Name.first_name, speciality:"cardio", bio: Faker::Quote.famous_last_words)
end

