# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do(
    User.create(first_name: Faker::Name.first_name,
                 last_name: Faker::Name.last_name,
                 password: 'password',
                 password_confirmation: 'password',
                 email: Faker::Internet.email,
                 cohort_id: rand(1..5),
                 description: Faker::Lorem.paragraph
                 );
  ) end

Kbomb.create(name: 'Ruby', description: Faker::Lorem.paragraph)
Kbomb.create(name: 'Rails', description: Faker::Lorem.paragraph)
Kbomb.create(name: 'Sinatra', description: Faker::Lorem.paragraph)
Kbomb.create(name: 'JavaScript', description: Faker::Lorem.paragraph)
Kbomb.create(name: 'jQuery', description: Faker::Lorem.paragraph)
Kbomb.create(name: 'Ajax', description: Faker::Lorem.paragraph)
Kbomb.create(name: 'Objective-C', description: Faker::Lorem.paragraph)
Kbomb.create(name: 'Python', description: Faker::Lorem.paragraph)
Kbomb.create(name: 'Clojure', description: Faker::Lorem.paragraph)
Kbomb.create(name: 'OOJS', description: Faker::Lorem.paragraph)
Kbomb.create(name: 'HTML', description: Faker::Lorem.paragraph)
Kbomb.create(name: 'CSS', description: Faker::Lorem.paragraph)

User.all.each do |user|
  user.kbombs << (Kbomb.all.sample(rand(3..5)))
end
