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

file = URI.open('https://res.cloudinary.com/willzor/image/upload/v1620323847/Paysan_guchcv.jpg')
farming = Outfit.new(name:"get country style farmer", description: "Ya don't want to come in a childish n urban style to an outside job adn that's why i propose you my farmer outfit, i promise you will make good impression to ur boss and yo ll sweat with ease in this farmer outfit", price: 21, category: "Outdoor")
farming.user = guillaume
farming.photos.attach(io: file, filename: 'Paysan_guchcv.jpg', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/willzor/image/upload/v1620325590/Astronaut_xijutg.jpg')
astro = Outfit.new(name: "get hight safely", description: "You really don't want to go in space with a tee-shirt, prove your future employer that you know this fact by commig fully geared", price: 9900, category: "other")
astro.user = brice
astro.photos.attach(io: file, filename: 'Astronaut_xijutg.jpg', content_type: 'image.jpg')

file = URI.open('https://res.cloudinary.com/willzor/image/upload/v1620326388/scientist_sqoljo.jpg')
scientist = Outfit.new(name: "√Credibility = Style²", description: "Everyone think you're smart and intoo science when you have a white lab coat, it's used but not dirty, just enought to imply your ability", price: 34, category: "Academic")
scientist.user = adrien
scientist.photos.attach(io: file, filename: 'scientist_sqoljo.jpg', content_type: 'image.jpg')

file = URI.open('https://res.cloudinary.com/willzor/image/upload/v1620324814/bucheron_xoabdf.jpg')
lumberjack = Outfit.new(name:"Lumberjack Perfect", description: "You seriously think you can work in job involving trees without your red lumberjack shirt?", price: 23, category: "Outdoor")
lumberjack.user = william
lumberjack.photos.attach(io: file, filename: 'bucheron_xoabdf.jpg', content_type: 'image/jgg')

file = URI.open('https://res.cloudinary.com/willzor/image/upload/v1620322738/UniM_qacn6t.jpg')
tech_interview = Outfit.new(name:"Let's shine as a baby unicorn", description:"You cannot join a unicorn without looking like a unicorn. As simple as that. 100 percent success rate", price:"35", category:"startup")
tech_interview.user = guillaume
tech_interview.photos.attach(io: file, filename: 'UniM_qacn6t.jpg', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/willzor/image/upload/v1619721554/banker_nsxcu2.jpg')
ma_interview = Outfit.new(name:"Become a Wolf of Wall Street", description:"Was Leonardo DiCaprio a professional banker? No but at least he wore the uniform. There is no other factor of success", price:"10000",category:"corporate")
ma_interview.user = brice
ma_interview.photos.attach(io: file, filename: 'banker_nsxcu2.jpg', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/willzor/image/upload/v1620322662/witch_gjvakf.jpg')
teacher_interview = Outfit.new(name:"How to be a magic teacher at Poudlard", description:"Albus Dumbledore has only a uniform and no talent. Be like Albus, become a wizard master.", price: "56", category:"public")
teacher_interview.user = adrien
teacher_interview.photos.attach(io: file, filename: 'witch_gjvakf.jpg', content_type: 'image/jpg')
tech_interview.save!
ma_interview.save!
teacher_interview.save!
farming.save!
lumberjack.save!
astro.save!
scientist.save!
puts 'Finished!'

