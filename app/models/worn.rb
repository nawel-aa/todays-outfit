class Worn < ApplicationRecord
  belongs_to :user
  belongs_to :outfit
  has_many :items, through: :outfit
end
