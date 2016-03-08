# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

10.times do
  User.create!(
  :username => Faker::Internet.user_name,
  :email => Faker::Internet.email,
  :password => 'helloworld',
  :password_confirmation => 'helloworld'
  )
end

users = User.all

50.times do
  Item.create!(
  :user => users.sample,
  :name => Faker::Lorem.sentence
  )
end


puts "#{User.count} users created"
puts "#{Item.count} items created"
