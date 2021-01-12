class Worn < ApplicationRecord
  belongs_to :user
  belongs_to :outfit
end
