# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Destroying users, items, outfits and categories..."
User.destroy_all

puts "Creating a user..."
user = User.create!(email: "nawel@email.com", password: "123456")

####################################
#              ITEMS
####################################
puts "Creating items..."

# Tops
5.times do
  Item.create!(
    name: "#{Faker::Commerce.unique.product_name} Top",
    item_type: "Top",
    user: user
  )
end
Faker::UniqueGenerator.clear

# Bottom
5.times do
  Item.create!(
    name: "#{Faker::Commerce.unique.product_name} Bottom",
    item_type: "Bottom",
    user: user
  )
end
Faker::UniqueGenerator.clear

# Full body
5.times do 
  Item.create!(
    name: "#{Faker::Commerce.unique.product_name} Dress",
    item_type: "Full body",
    user: user
  )
end
Faker::UniqueGenerator.clear

# Accessory
5.times do
  Item.create!(
    name: "#{Faker::Games::Pokemon.unique.name} Accessory",
    item_type: "Accessory",
    user: user
  )
end
Faker::UniqueGenerator.clear

# Underwear
5.times do
  Item.create!(
    name: "#{Faker::Color.unique.color_name} Underwear",
    item_type: "Underwear",
    user: user
  )
end
Faker::UniqueGenerator.clear

# Shoes
5.times do
  Item.create!(
    name: "#{Faker::Commerce.unique.material} shoes",
    item_type: "Shoes",
    user: user
  )
end
Faker::UniqueGenerator.clear


####################################
#             OUTFITS
####################################
puts "Creating outfits..."

weather = %w[rainy cold hot snowy]

20.times do
  Outfit.create!(
    name: "#{Faker::Dessert.unique.flavor} outfit",
    category: Category.all.sample,
    weather: weather.sample,
    user: user
  )
end


