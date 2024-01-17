puts "Seeding started"

Dog.create!([
  [
  {
    "name": "Max",
    "age": 2,
    "breed": "Siberian Husky",
    "user_id": 1,
    "behaviors": ["Playful", "Energetic", "Friendly"]
  },
  {
    "name": "Bella",
    "age": 3,
    "breed": "Dachshund",
    "user_id": 2,
    "behaviors": ["Curious", "Affectionate", "Alert"]
  },
  {
    "name": "Cooper",
    "age": 1,
    "breed": "Shih Tzu",
    "user_id": 4,
    "behaviors": ["Gentle", "Social", "Cuddly"]
  },
  {
    "name": "Lola",
    "age": 4,
    "breed": "Boxer",
    "user_id": 5,
    "behaviors": ["Energetic", "Playful", "Loyal"]
  },
  {
    "name": "Ruby",
    "age": 2,
    "breed": "Cavalier King Charles Spaniel",
    "user_id": 6,
    "behaviors": ["Sweet", "Gentle", "Adaptable"]
  },
  {
    "name": "Rocky",
    "age": 3,
    "breed": "Pug",
    "user_id": 7,
    "behaviors": ["Funny", "Charming", "Easygoing"]
  },
  {
    "name": "Milo",
    "age": 1,
    "breed": "Poodle",
    "user_id": 1,
    "behaviors": ["Intelligent", "Active", "Obedient"]
  },
  {
    "name": "Charlie",
    "age": 2,
    "breed": "Labrador Retriever",
    "user_id": 2,
    "behaviors": ["Loyal", "Friendly", "Playful"]
  }
]

])

puts "Seeding complete"