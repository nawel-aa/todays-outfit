class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # To make authenticated API calls (update, delete, create)
  acts_as_token_authenticatable

  has_many :items, dependent: :destroy
  has_many :worn, dependent: :destroy
  has_many :categories, dependent: :destroy

  has_many :outfits_owned, class_name: "Outfit", dependent: :destroy
  has_many :outfits_worn, through: :worn, source: :outfit
end
