# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Deleting all database'

WorkOfArt.destroy_all
User.destroy_all
Exhibition.destroy_all
UserCollabRelationship.destroy_all
ToDo.destroy_all
Collab.destroy_all

puts 'Database deleted'

puts 'Creating users...'

5.times do
	user = User.create!(
      email: Faker::Internet.email,
      username: Faker::Artist.unique.name,
      password: 'password',
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      art_type: %w(abstract animation calligraphy design digital musician painter).sample,
      description: Faker::Lorem.sentence(word_count: 10),
      city: Faker::Address.city,
      country: Faker::Address.country,
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude,
      birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
  )

	collab = Collab.create!(
  	name: Faker::Lorem.unique.word,
  )

  exhibition = Exhibition.create!(
      name: Faker::Lorem.unique.word,
      start_date: Faker::Date.between(from: 20.days.ago, to: Date.today),
      end_date: Faker::Date.forward(days: 20),
      description: Faker::Lorem.sentence(word_count: 8),
      city: Faker::Address.city,
      country: Faker::Address.country,
      category: %w(visual sculpture performance music).sample,
      address: Faker::Address.street_address,
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude,
      collab: collab
    )

  user_collab_relationship = UserCollabRelationship.create!(
    collab: collab,
    user: user,
    status: "accepted"
  )

  work_of_art = WorkOfArt.create!(
    name: Faker::Lorem.word,
    description: Faker::GreekPhilosophers.quote,
    creation_date: Faker::Date.in_date_period,
    user: user,
    collab: collab
  )
end

puts 'User created'
