# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Agent.create!(name: "Rafael Montas",
              email: "rafaelmontas1@gmail.com",
              phone_number: "8099080000",
              password: "montas20.",
              password_confirmation: "montas20.",
              admin: true)
if Rails.env.development?
  49.times do |n|
    name = Faker::Name.name
    email = "example#{n+1}@gmail.com"
    phone_number = "8099080000"
    password = "password"
    Agent.create!(name: name,
                  email: email,
                  phone_number: "8090#{n+1}0000",
                  password: password,
                  password_confirmation: password)
  end
end
