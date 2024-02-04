class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"

  def friend_name
    friend = User.find(friend_id)
    friend_name = friend[:name]
  end
end
