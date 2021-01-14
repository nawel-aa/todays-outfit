json.extract! @item, :id, :name, :item_type, :photo
json.outfits @item.outfits, :id, :name
json.extract! @item, :created_at, :updated_at
