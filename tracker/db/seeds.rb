# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do
  guid = SecureRandom.uuid
  url = ['http://localhost:3000/', 'http://localhost:3000/about', 'http://localhost:3000/contact'].sample
  accessed_at = 1.hour.ago - (rand(14400).minutes)
  created_at = accessed_at + 10.seconds

  Visit.create!(guid: guid, url: url, accessed_at: accessed_at, created_at: created_at)
end