json.id dog.id
json.user_id dog.user_id
json.name dog.name
json.breed dog.breed
json.age dog.age
json.image_url dog.image_url
json.behaviors dog.behaviors do |behavior|
  json.id behavior.id
  json.dog_id behavior.dog_id
  json.behavior behavior.behavior
end
