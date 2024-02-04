json.id user.id
json.name user.name
json.email user.email
json.dogs user.dogs do |dog|
  json.id dog.id
  json.name dog.name
  json.breed dog.breed
  json.age dog.age
  json.image_url dog.image_url
  json.behaviors dog.behaviors
end
json.image_url user.image_url
json.friendships user.friendships do |friendship|
  json.id friendship.id
  json.friend_id friendship.friend_id
  json.status friendship.status
  json.friend_name friendship.friend_name
  json.friend_image friendship.friend_image
end
