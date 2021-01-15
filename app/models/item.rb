class Item < ApplicationRecord
  has_and_belongs_to_many :outfits
  has_many :worn, through: :outfits
  belongs_to :user

  validates :item_type, inclusion: {
    in: %w[top bottom full_body accessory underwear shoes]
  }
end
