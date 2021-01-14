json.extract! @item, :id, :name, :item_type, :photo
json.outfits @item.outfits, :id, :name
json.last_date_worn @last_date_worn unless @last_date_worn.nil?
json.extract! @item, :created_at, :updated_at
