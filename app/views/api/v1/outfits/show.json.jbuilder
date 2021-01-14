json.extract! @outfit, :id, :name
json.categories @outfit.categories, :id, :name unless @outfit.categories.empty?
json.last_date_worn @last_date_worn unless @last_date_worn.nil?
json.items @outfit.items, :id, :name
json.extract! @outfit, :photo, :weather, :created_at, :updated_at
