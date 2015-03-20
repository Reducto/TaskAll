# namespace :setup do
#   desc "TODO"
#   task example: :environment do
#   end

# end



require 'csv'

# 1.  Нужно сделать rake задачу, которая очистит и сгенерирует базу из задания на генерацию (FactoryGir).



# Этот же самый механизм цепочки заданий используется для того,
# чтобы запустить задачу в среде выполнения Rails - будут доступны
# все классы и модули, которые вы используете в своем Rails-приложении (
# веб-приложении), если вам необходимо, например, работа моделями 
# базы данных (ActiveRecord). Достаточно включить в цепочку вашей задачи задачу :environment

Rails.logger = Logger.new('log/test.log')
# That'll show us what the broken logger is and will hopefully workaround the issue in the second line by explicitly pointing it to stdout.
namespace :db do
  desc "Factory Girl clear"
  task clear: :environment do
  	puts 'Generate db:reset'
    Rake::Task['db:reset'].invoke 
    # This one executes the dependencies, but it only executes the task if it has not already been invoked.
    puts 'Done db:reset'
  end
end


# 2.  Нужно сделать rake задачу, которая будет создавать список пользователей для почтовой рассылки. Формат файла csv.



namespace :mail do
  desc 'List mailer'
  task list: :environment do
  	puts 'Generate List mailer'
  #     	Writing
		# To a File
  #     This class provides a complete interface to CSV files and data. 
  #     It offers tools to enable you to read and write to 
  #     and from Strings or IO objects, as needed.
    CSV.open('public/mail.csv', 'wb') do |csv|
      csv << ['email', 'name']
      Author.all.each do |a|
        csv << [a.email, a.name]
      end
    end
    puts 'Done list mailer'
  end
end


# 3.  Нужно сделать rake задачу, которая будет создавать отчет в виде html файла. В отчете должно быть:
#  - число авторов
#  - число статей
#  - число коментариев
#  - название статьи и ссылка на статью с самым большим количеством комментариев
#  - среднее кол-во комментариев в статьях
#  - таблица тегов ( тег, кол-во статей с данным тегом )


namespace :report do
  desc "Export html"
	task html: :environment do
	puts 'Create report for html file'
    report_path = 'public/report' + Date.today.to_s + '.html'
    max_comm = Comment.group(:post_id).count.sort_by {|k,v| v}.last
    File.open(report_path, 'wb') do |file|
      file << '
      <html>
      <head>
        <meta charset="utf-8">
          <title>Report</title>
          <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
      </head>
      <body>
      <div class="col-md-6">
	  <div class="panel panel-primary">
  		<div class="panel-heading">
    		<h3 class="panel-title">Отчет</h3>'
       file << '<h3 class="panel-title"> Время создания: '
       file << Time.now
       file << '</h3></div>
    	<div class="panel-body">
    		<div class="form-group">
            <label>Число авторов:</label> ' 
      file << Time.now
      file << Author.all.count
      file << '</div><div class="form-group">'
      file << '<label>Число статей:</label> '
      file << Post.all.count
      file << '</div><div class="form-group">'
      file << '<label>Число комментариев:</label> '
      file << Comment.all.count
      file << '</div><div class="form-group"><label>Статья с самым большим количеством комментариев:</label> '
      file << '<br><a href="/posts/'
      file << max_comm[0]
      file << '/show">'
      file << Post.find_by(id: max_comm[0]).title
      file << '</a>(кол-во комментариев: '
      file << max_comm[1]
      file << ')</div><div class="form-group">'
      file << '<label>Среднее кол-во комментариев:</label> '
      file << Comment.all.count / Author.all.count
      file << '</div><div class="panel panel-success">'
      file << '<div class="panel-heading">Таблица тэгов:</div>'
      file << '<table class="table"> <tr> <th>Тег</th><th>Кол-во статей</th></tr>'
      Tag.all.each do |tag|
        file << '<tr><td>'
        file << tag.name
        file << '</td><td>'
        file << tag.posts.count
        file << '</td></tr>'
      end
      file << '</table></div></div></div></body> </html>'
    end
    puts 'Done report for html file'
  end
end

# 4. Сделате контроллер, который будет вывотить список 
# сделанных отчетов и ссылки на них.
# Done



# 5. Нужно сделать rake задачу, которая будет удалять старые статьи,
#  должно остаться по 5 самых новых статей от каждого автора.


task :oldpost do
	puts 'Delete old post'
 	authors = Author.joins( :posts ).group( 'users.id' ).having( 'count( author_id ) > 5' ).find_in_batches(batch_size: 500) do |part|
		part.each do |author|
			posts = Author.first.posts(:order => "created_at asc", :limit => 5)
			Post.destroy_all(['author_id = (1), id NOT IN (2)', author.id, posts.collect(&:id)])
   end
  end
  puts 'Done  Delete old post'
end 


# delete from posts where userid = id && id not in X