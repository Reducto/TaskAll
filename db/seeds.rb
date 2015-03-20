# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# puts 'generation_start'
# 20.times do
#   FactoryGirl.create(:tag)
# end

# 20.times do |i|
#   puts "author#{i} "
#   FactoryGirl.create(:author)
# end

# 5.times do 
#   	FactoryGirl.create(:tag)
# end
# 5.times do
# 	author = FactoryGirl.create(:author)
# 	# rand(1..10).times do
#  #   		post = FactoryGirl.create(:post, author_id: author.id)
#     rand(0..10).times do
#       	comment = FactoryGirl.create(:comment, post_id: post.id)
#     # end
#   	end
# end

puts 'generation_start'
5.times do
  FactoryGirl.create(:tag)
end

20.times do |i|
  puts "author#{i} "
  FactoryGirl.create(:author)
end
