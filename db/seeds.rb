puts "Seeding started"

10.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    image_url: "https://picsum.photos/200/300?random=#{rand(1..1000)}"
  )
  user.password = 'password'
  user.password_confirmation = 'password'
  user.save
end

# user_ids = User.pluck(:id)
# 10.times do
#   dog = Dog.new(
#     name: Faker::Creature::Dog.name,
#     breed: Faker::Creature::Dog.breed,
#     age: rand(1..12),
#     user_id: user_ids.sample
#   )
#   dog.save
# end

# user_ids.each do |user_id|
#   Dog.create(
#     name: Faker::Creature::Dog.name,
#     breed: Faker::Creature::Dog.breed,
#     age: rand(1..12),
#     user_id: user_id
#   ) unless Dog.exists?(user_id: user_id)
# end


puts "Seeding complete"