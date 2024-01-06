class Playdate < ApplicationRecord
  has_many :playdate_dogs
  has_many :dogs, through: :playdate_dogs
  belongs_to :user
  has_many :comments
end
