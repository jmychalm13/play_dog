class User < ApplicationRecord
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :dogs
  has_many :playdates
  has_many :comments
end
