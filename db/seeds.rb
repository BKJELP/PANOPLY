# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
puts 'We delete the old data'
User.destroy_all
Outfit.destroy_all


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

puts 'Creating outfits...'

file = URI.open('https://res.cloudinary.com/willzor/image/upload/v1619721468/Unic_i1k2aq.jpg')
tech_interview = Outfit.new(name:"Let's shine as a baby unicorn", description:"You cannot join a unicorn without looking like a unicorn. As simple as that. 100 percent success rate", price:"35", category:"startup")
tech_interview.user = guillaume
tech_interview.photos.attach(io: file, filename: 'Unic_i1k2aq.jpg', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/willzor/image/upload/v1619721554/banker_nsxcu2.jpg')
ma_interview = Outfit.new(name:"Become a Wolf of Wall Street", description:"Was Leonardo DiCaprio a professional banker? No but at least he wore the uniform. There is no other factor of success", price:"10000",category:"corporate")
ma_interview.user = brice
ma_interview.photos.attach(io: file, filename: 'banker_nsxcu2.jpg', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/willzor/image/upload/v1619721459/wizard-costume_vxcm2f.jpg')
teacher_interview = Outfit.new(name:"How to be a magic teacher at Poudlard", description:"Albus Dumbledore has only a uniform and no talent. Be like Albus, become a wizard master.", price: "56", category:"public")
teacher_interview.user = adrien
teacher_interview.photos.attach(io: file, filename: 'wizard-costume_vxcm2f.jpg', content_type: 'image/jpg')
tech_interview.save!
ma_interview.save!
teacher_interview.save!
puts 'Finished!'

