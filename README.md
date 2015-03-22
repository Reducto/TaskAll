1.
Сделайте следующие модели:
- Авторы имя, почта, город, адрес, дата рождения
-Посты (статьи) заголовок, текст
-Теги название тега
-Комментарии имя пользователя, текст комментария
Используя гемы: Faker и FactoryGirl сделайте генерацию:

20 авторов
-у каждого автора должно быть от 1 до 10 статей
-в каждой статье от 0 до 10 комментариев
-20 тегов
-каждая статье должна иметь 3 случайных тега

Модели должны быть связаны. После вызова rake db:reset в базе должны сгенерированы новые данные

2.
Продолжите задание task_seed. Нужно сделать следующие страницы:
-Список авторов, где должны быть все авторы.
-Должна быть пагинация по 10.
-Должна быть возможность перейти на подробную информацию об авторе.

Подробная информация об авторе
-Содержит полную информацию об авторе
-Должен быть список статей данного автора, отсортированы таким образом, чтобы вверху была самая последняя статья.
-Должна быть возможность перейти на любую статью автора.
-Рядом с каждой статьей список тегов.

Список статей:
-Должно отображаться название, автор, теги
-Должна быть пагинация по 10.
-Должна быть возможность перейти на подробную информацию о статье.
-Должна быть отсортировано таким образом, чтобы вверху была самая последняя статья.

Все теги должны быть ссылками, после нажатия на которые пользователь перейдет на страницу со списоком статей в которых присутствует данный тег. Сделайте меню, которое будет на каждой станице и содержит ссылки на: список авторов, список статей


3.
Нужно сделать rake задачу, которая очистит и сгенерирует базу из задания на генерацию (FactoryGir).
Нужно сделать rake задачу, которая будет создавать список пользователей для почтовой рассылки. Формат файла csv.
Нужно сделать rake задачу, которая будет создавать отчет в виде html файла. В отчете должно быть:
-число авторов
-число статей
-число коментариев
-название статьи и ссылка на статью с самым большим количеством комментариев
-среднее кол-во комментариев в статьях
-таблица тегов ( тег, кол-во статей с данным тегом )
Сделате контроллер, который будет вывотить список сделанных отчетов и ссылки на них.
*Нужно сделать rake задачу, которая будет удалять старые статьи, должно остаться по 5 самых новых статей от каждого автора.(no)
