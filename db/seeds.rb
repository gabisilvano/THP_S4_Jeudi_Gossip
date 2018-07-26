# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



@num_city = 10
@num_user = 10
@num_potin = 20
@num_tag = 10
@num_pm = 1
@num_comment = 20
@num_like = 20

City.delete_all
User.delete_all
Potin.delete_all
Tag.delete_all
PrivateMessage.delete_all
Comment.delete_all

@num_city.times do 
    City.create(name: Faker::Address.city)	
end

@num_city.times do
	User.create(first_name: Faker::Name.first_name,last_name: Faker::Name.last_name , description: Faker::Hobbit.quote  , email: Faker::Internet.email ,age:Faker::Number.between(1, 70), city_id: Faker::Number.between(1, @num_city))
end

@num_potin.times do
	Potin.create(title:Faker::Simpsons.location,content: Faker::Hobbit.quote ,date: Faker::Time.between(DateTime.now - 1, DateTime.now) ,user_id: Faker::Number.between(1, @num_user),city_id: Faker::Number.between(1, @num_city))
end

@num_tag.times do
	Tag.create(potin_id: Faker::Number.between(1, @num_tag))
end

@num_pm.times do
	PrivateMessage.create(content:Faker::StrangerThings.quote, date: Faker::Time.between(DateTime.now - 1, DateTime.now), sender_id: Faker::Number.between(1, @num_user), recipient_id: Faker::Number.between(1, @num_user))
end

@num_comment.times do
	Comment.create(content:Faker::StrangerThings.quote, user_id: Faker::Number.between(1, @num_user), potin_id: Faker::Number.between(1, @num_potin))
end

(@num_like/2).times do
	Like.create(potin_id:Faker::Number.between(1, @num_potin))
	Like.create(comment_id:Faker::Number.between(1, @num_comment))
end

puts "----------------------- Seed -----------------------"
puts "Created #{@num_city} cities"
puts "Created #{@num_user} users"
puts "Created #{@num_potin} gossips"
puts "Created #{@num_tag} tags"
puts "Created #{@num_pm} private messages"
puts "Created #{@num_comment} comments"
puts "Created #{@num_like} likes"
puts "-------------------------END-------------------------"
