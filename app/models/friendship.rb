class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"

  def friend_name
    friend = User.find(friend_id)
    friend_name = friend[:name]
  end

  def friend_image
    friend = User.find(friend_id)
    friend_image = friend[:image_url]
  end
end
