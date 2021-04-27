# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Creating admin...'

guillaume = User.new(first_name: "Guillaume", last_name: "Fraud", password: "123456", email: "guillaume@rentease.com")
william = User.new(first_name: "William", last_name: "Allin", password: "123456", email: "william@rentease.com")
brice = User.new(first_name: "Brice", last_name: "Levasseur", password: "123456", email: "brice@rentease.com")
adrien = User.new(first_name: "Adrien", last_name: "Bellamy", password: "123456", email: "adrien@rentease.com")
guillaume.save!
william.save!
brice.save!
adrien.save!
puts 'Finished!'
