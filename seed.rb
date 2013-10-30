require 'faker'
require_relative './app'
require_relative 'app/models/member'
require_relative 'app/models/post'

25.times do 
	Member.create(first_name: Faker::Name.first_name)
end

25.times do
	Post.create(member_id: (rand(25+1)), contents: Faker::Lorem.sentence)
end