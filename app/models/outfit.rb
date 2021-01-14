class Outfit < ApplicationRecord
  has_and_belongs_to_many :items
  has_and_belongs_to_many :categories
  belongs_to :user
  has_many :worn, dependent: :destroy

  validates :weather, inclusion: {
    in: %w[rainy cold hot snowy]
  }, allow_nil: true

  validates :items, presence: true
end
