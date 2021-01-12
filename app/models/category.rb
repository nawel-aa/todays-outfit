class Category < ApplicationRecord
  belongs_to :user, optional: true
  has_and_belongs_to_many :outfits

  validates :name, presence: true
  validates :name, uniqueness: { scope: :user, message: "This category already exists.", case_sensitive: false }

  def self.create_default(user)
    categories = ["Comfy stuff", "Serious sh*t", "Shiny party bling", "Sweat absorbant"]
    categories.each { |category| Category.create(name: category, user: user) }
  end
end
