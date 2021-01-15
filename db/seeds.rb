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
user = User.new(email: "nawel@email.com", password: "123456")
user.skip_confirmation!
user.save!
Category.create_default(user)

####################################
#              ITEMS
####################################
puts "Creating items..."

# Tops
5.times do
  Item.create!(
    name: "#{Faker::Commerce.unique.product_name} Top",
    item_type: :top,
    user: user
  )
end
Faker::UniqueGenerator.clear

# Bottom
5.times do
  Item.create!(
    name: "#{Faker::Commerce.unique.product_name} Bottom",
    item_type: "bottom",
    user: user
  )
end
Faker::UniqueGenerator.clear

# Full body
5.times do 
  Item.create!(
    name: "#{Faker::Commerce.unique.product_name} Dress",
    item_type: "full_body",
    user: user
  )
end
Faker::UniqueGenerator.clear

# Accessory
5.times do
  Item.create!(
    name: "#{Faker::Games::Pokemon.unique.name} Accessory",
    item_type: "accessory",
    user: user
  )
end
Faker::UniqueGenerator.clear

# Underwear
5.times do
  Item.create!(
    name: "#{Faker::Color.unique.color_name} Underwear",
    item_type: "underwear",
    user: user
  )
end
Faker::UniqueGenerator.clear

# Shoes
5.times do
  Item.create!(
    name: "#{Faker::Commerce.unique.material} shoes",
    item_type: "shoes",
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
  outfit = Outfit.new(
    name: "#{Faker::Dessert.unique.flavor} outfit",
    weather: weather.sample,
    user: user
  )
  first_random_category = Category.all.sample
  second_random_category = Category.all.reject{ |category| category == first_random_category }.sample
  outfit.categories << first_random_category
  outfit.categories << second_random_category

  random_top_item = Item.where(item_type: "top").sample
  random_bottom_item = Item.where(item_type: "bottom").sample
  random_accessory = Item.where(item_type: "accessory").sample
  random_shoes = Item.where(item_type: "shoes").sample

  outfit.items << random_top_item
  outfit.items << random_bottom_item
  outfit.items << random_shoes
  outfit.items << random_accessory

  outfit.save!
end


