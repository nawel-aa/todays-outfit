json.array! @worn do |worn|
  json.id worn.id
  json.outfit do
    json.id worn.outfit.id
    json.name worn.outfit.name
  end
  json.rejected worn.rejected
end
