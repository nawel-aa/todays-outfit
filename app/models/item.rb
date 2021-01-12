class Item < ApplicationRecord
  has_and_belongs_to_many :outfits
  belongs_to :user

  validates :item_type, inclusion: {
    in: ["Top", "Bottom", "Full body", "Accessory", "Underwear", "Shoes"]
  }
end
