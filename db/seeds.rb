users = File.open('./db/user_info.txt', 'r').read.split("\n")

users.each do |user_info|
  user_params = JSON.parse(user_info).merge({password: 'password', password_confirmation: 'password'})
  User.create(user_params)
end

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
