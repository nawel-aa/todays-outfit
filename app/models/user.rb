class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :outfits, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :worn, dependent: :destroy
  has_many :outfits, through: :worn, as: :outfits_worn
  has_many :categories, dependent: :destroy
end
