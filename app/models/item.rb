class Item < ApplicationRecord
  has_and_belongs_to_many :outfits
  belongs_to :user

  validates :type, inclusion: {
    in: %w[Top Bottom "Full Body" Accessory Underwear Shoes], message: "%<value> is not a valid type."
  }
end
