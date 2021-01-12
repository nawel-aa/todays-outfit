class Outfit < ApplicationRecord
  has_and_belongs_to_many :items
  belongs_to :user
  has_many :worn, dependent: :destroy

  validates :weather, inclusion: {
    in: %w[rainy cold hot snowy]
  }
end
