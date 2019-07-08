60.times do |i|
  name = Faker::Name.name
  Subject.create!(name: name, description: 's')

end
