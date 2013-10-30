require 'faker'

25.times do 
	Member.create(first_name: Faker::Name.first_name)
end

25.times do
	Post.create(contents: Faker::Lorem.sentence)
end