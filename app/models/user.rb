class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :friendships
  has_many :friends, through: :friendships, source: :friend
  has_many :dogs
  has_many :playdates
  has_many :comments
end
