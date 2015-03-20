require 'csv'

# desc "Export csv"
# task :export => :environment do
# 	CSV.open("public/reports/file #{Date.today.to_s}.csv", "wb") do |csv|
#  		csv << Author.column_names
# 		Author.all.each do |product|
#  			csv << product.attributes.values_at(*Author.column_names)
# 		end
# 	end
# end

# namespace :cv do
#   desc 'csv'
#   task export: :environment do
#   	puts 'Generate csv'
#     CSV.open("public/file #{Date.today.to_s}.csv", "wb") do |csv|
#     	csv << Author.column_names
# 		Author.all.each do |product|
#  			csv << product.attributes.values_at(*Author.column_names)
#       # csv << ['email', 'name']
#       # Author.all.each do |a|
#       #   csv << [a.email, a.name]
#       end
#     end
#     puts 'Done csv'
#   end
# end




































# Задание, задача
task :hello do
	puts 'Hll'	
end
# 
# Цепочка заданий
task :chain => :hello do
	puts 'LOOP'	
end
# В среде rails
task :railst => :environment do
	puts 'i can'
	author = Author.first
	puts author.name
end
# 
# Пространсво имён
namespace :prod do
	task :first => :environment do
		author = Author.first
		puts author.name
	end
	task :last => :environment do
		author = Author.last
		puts author.name
	end
end
# 

# Группа заданий
	task :first => :environment do
		author = Author.first
		puts author.name
	end
	task :last => :environment do
		author = Author.last
		puts author.name
	end
	task :all => [:first, :last]
# 

	desc 'First'
	task :fir do
		puts 'yes'
	end
	desc 'second'
	task :sec do
		puts 'no'
	end
	desc 'task all :fir and :sec'
	task :a => [:fir, :sec]
# 