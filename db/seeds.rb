# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

5.times do
    User.create!(
        first_name: Faker::Name.name, 
        last_name: Faker::Name.last_name, 
        mobile_number: Faker::Number.number(digits: 10), 
        address: Faker::Address.full_address, 
        state: Faker::Address.state, 
        pin_code: Faker::Address.zip_code.to_i, 
        email: Faker::Internet.email,
        password: 123456,
        password_confirmation: 123456, 
        created_at: nil, 
        updated_at: nil, 
        role: "Mortgagee"
    )
end
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?