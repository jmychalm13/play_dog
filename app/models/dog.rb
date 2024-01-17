class Dog < ApplicationRecord
  belongs_to :user
  has_many :behaviors
  has_many :playdate_dogs
  has_many :playdates, through: :playdate_dogs
end


