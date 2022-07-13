# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# create admin
# if Rails.env.development?
Admin.create!(name: 'Admin 1', email: 'admin@example.com', password: 'password',
              password_confirmation: 'password')
# end


a = Array.new
# create customers
var= rand(1..50000)
a.push(var)
Customer.create!(name: 'Isaac Lewis', email: 'isaac@example.com',
                 mobile_number: Faker::PhoneNumber.cell_phone, address: Faker::Address.full_address, id: var)
49.times do
  var2= rand(1..50000)
  a.push(var2)
  name = Faker::Name.unique.name
  Customer.create!(name: name, email: Faker::Internet.safe_email(name: name),
                   mobile_number: Faker::PhoneNumber.cell_phone, address: Faker::Address.full_address,id: var2)
end
puts 'Customers created...'

b= Array.new
# vbr = rand(1..50000)
# b.push(vbr)
20.times do
  question1= Question.create!(title: Faker::Lorem.question(word_count: 4, supplemental: false), content: Faker::Lorem.question(word_count: 10, supplemental: false), 
    customer_id: a.sample,category: ["Sports", "Entertainment", "Language", "Politics", "Technology"].sample )
  3.times do
    vbr = rand(1..50000)
    b.push(vbr)
    Comment.create!(id: vbr, body: Faker::Lorem.sentence(word_count: 3, supplemental: true), customer_id: a.sample, question: question1)
  end
  10.times do
    Like.create!(customer_id: a.sample, comment_id: b.sample , counter:[1,-1].sample)
  end
end
puts 'Question created...'

