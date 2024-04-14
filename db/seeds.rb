puts "Seeding started"

# Dog.create!([
#   [
#   {
#     "name": "Max",
#     "age": 2,
#     "breed": "Siberian Husky",
#     "user_id": 1,
#   },
#   {
#     "name": "Bella",
#     "age": 3,
#     "breed": "Dachshund",
#     "user_id": 2,
#   },
#   {
#     "name": "Cooper",
#     "age": 1,
#     "breed": "Shih Tzu",
#     "user_id": 4,
#   },
#   {
#     "name": "Lola",
#     "age": 4,
#     "breed": "Boxer",
#     "user_id": 5,
#   },
#   {
#     "name": "Ruby",
#     "age": 2,
#     "breed": "Cavalier King Charles Spaniel",
#     "user_id": 6,
#   },
#   {
#     "name": "Rocky",
#     "age": 3,
#     "breed": "Pug",
#     "user_id": 7,
#   },
#   {
#     "name": "Milo",
#     "age": 1,
#     "breed": "Poodle",
#     "user_id": 1,
#   },
#   {
#     "name": "Charlie",
#     "age": 2,
#     "breed": "Labrador Retriever",
#     "user_id": 2,
#   }
# ]

# ])

# Create an array of dog behaviors
# behaviors = ['friendly', 'vocal', 'playful', 'curious', 'energetic', 'shy', 'loyal', 'stubborn', 'gentle']

# # Seed the Behavior model with 10 items
# 10.times do
#   # Randomly select a dog_id from the given numbers
#   dog_id = [2, 3, 4, 5, 6, 7].sample

#   # Randomly select behaviors (you can have more than one behavior per id)
#   selected_behaviors = behaviors.sample(rand(1..behaviors.length))

#   # Create Behavior records
#   selected_behaviors.each do |behavior|
#     Behavior.create(dog_id: dog_id, behavior: behavior)
#   end
# end

# 10.times do
#   user = User.new(
#     name: Faker::Name.name,
#     email: Faker::Internet.email,
#     image_url: "https://picsum.photos/200/300?random=#{rand(1..1000)}"
#   )
#   user.password = 'password'
#   user.password_confirmation = 'password'
#   user.save
# end

10.times do
  user_ids = User.pluck(:id)
  dog = Dog.new(
    name: Faker::Creature::Dog.name,
    breed: Faker::Creature::Dog.breed,
    age: rand(1..12),
    user_id: user_ids.sample
  )
  dog.save
end


puts "Seeding complete"