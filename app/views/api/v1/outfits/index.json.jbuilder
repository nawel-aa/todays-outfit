
json.array! @outfits do |outfit|
  json.extract! outfit, :id, :name
  json.categories outfit.categories, :id, :name
  json.items outfit.items, :id, :name
  json.extract! outfit, :photo, :weather, :created_at, :updated_at
end
