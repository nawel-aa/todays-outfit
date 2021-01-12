class Category < ApplicationRecord
  belongs_to :user, optional: true

  validates :name, presence: true
  validates :name, uniqueness: { scope: :user, message: "This category already exists.", case_sensitive: false }
end
