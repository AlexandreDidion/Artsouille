# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
      birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
  )
end

puts 'Users created'

puts 'Creating collabs...'

5.times do
    collab = Collab.create!(
        name: name: Faker::Lorem.word,
    )
end

puts 'Collabs created'

puts 'Creating exhibitions'

  5.times do
    exhibition = Exhibition.create!(
        name: name: Faker::Lorem.word,
        start_date: Faker::Date.between(from: 20.days.ago, to: Date.today),
        end_date: Faker::Date.forward(days: 20),
        description: Faker::Lorem.sentence(word_count: 8),
        category: %w(visual sculpture performance music).sample,
        address: Faker::Address.street_address,
        collab: Collab.find(i + 1),
    )
end

puts 'Exhibitions created'

puts 'Creating users_collabs...'
 
5.times do
    users_collabs = UsersCollab.create!(
        user: User.find(i + 1),
        collab: Collab.find(i + 1),
    )
end

puts 'Users_Collab created'

puts 'Creating works of art...'

5.times do
    work_of_arts = WorkOfArt.create!(
        name: Faker::Lorem.word,
        description: Faker::GreekPhilosophers.quote,
        creation_date: Faker::Date.in_date_period,
        user: User.find(i + 1),
        collab: Collab.find(i + 1),
    )
end

puts 'Works of art created'

puts 'Creating work of art favorites'

  5.times do
    work_of_art_favorites = WorkOfArtFavorite.create!(
        user: User.find(i + 1),
        work_of_arts: WorkOfArt.find(i + 1),
    )
end

puts 'Work of art created '
  