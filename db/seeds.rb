# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

user1 = User.create!(
  first_name: "meenakshi",
  last_name: "gupta",
  mobile_number: "9887241721",
  address: "6/149 vdn jaipur",
  state: "rajasthan",
  pin_code: "203039",
  email: Faker::Internet.email,
  password: 123456,
  password_confirmation: 123456,
  created_at: nil,
  updated_at: nil,
  role: "Mortgagee"
)

user2 = User.create!(
  first_name: "kanishka",
  last_name: "joshi",
  mobile_number: "9887241621",
  address: "6/134 vdn jaipur",
  state: "rajasthan",
  pin_code: "203038",
  email: Faker::Internet.email,
  password: 123456,
  password_confirmation: 123456,
  created_at: nil,
  updated_at: nil,
  role: "Mortgagor"
)

Invitation.create(
  user_id: user1.id,
  friend_id: user2.id,
  confirmed: true,
  created_at: nil,
  updated_at: nil,
)

conv = Conversation.create(
  sender_id: user1.id,
  receiver_id: user2.id,
  created_at: nil,
  updated_at: nil,
)

Message.create(
  conversation_id: conv.id,
  user_id: user1.id,
  body:"Hello",
  created_at: nil,
  updated_at: nil,
)

Message.create(
  conversation_id: conv.id,
  user_id: user2.id,
  body:"Hii",
  created_at: nil,
  updated_at: nil,
  )

Message.create(
  conversation_id: conv.id,
  user_id: user1.id,
  body:" i want 5000 rs",
  created_at: nil,
  updated_at: nil,
  )

Message.create(
  conversation_id: conv.id,
  user_id: user2.id,
  body:"i can give but i want something precious thing to keep as a security",
  created_at: nil,
  updated_at: nil,
  )
Message.create(
  conversation_id: conv.id,
  user_id: user1.id,
  body:"i can give gold as a security ",
  created_at: nil,
  updated_at: nil,
  )

Message.create(
  conversation_id: conv.id,
  user_id: user1.id,
  body:" okay deal",
  created_at: nil,
  updated_at: nil,
  )

# 5.times do
#     User.create!(
#         first_name: Faker::Name.name,
#         last_name: Faker::Name.last_name,
#         mobile_number: Faker::Number.number(digits: 10),
#         address: Faker::Address.full_address,
#         state: Faker::Address.state,
#         pin_code: Faker::Address.zip_code.to_i,
#         email: Faker::Internet.email,
#         password: 123456,
#         password_confirmation: 123456,
#         created_at: nil,
#         updated_at: nil,
#         role: "Mortgagee"
#     )
# end
#
# 5.times do
#     User.create!(
#       first_name: Faker::Name.name,
#       last_name: Faker::Name.last_name,
#       mobile_number: Faker::Number.number(digits: 10),
#       address: Faker::Address.full_address,
#       state: Faker::Address.state,
#       pin_code: Faker::Address.zip_code.to_i,
#       email: Faker::Internet.email,
#       password: 123456,
#       password_confirmation: 123456,
#       created_at: nil,
#       updated_at: nil,
#       role: "Mortgagor"
#     )
# end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?