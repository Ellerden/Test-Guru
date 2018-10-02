# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([{ title: 'Computer Science' },
                               { title: 'AI' },
                               { title: 'История' },
                               { title: 'Динозавры' },
                               { title: 'Кинематограф' }])

tests = Test.create!([{ title: 'Кто что снял?', level: 2, category_id: categories[4].id },
                      { title: 'Как хорошо вы знаете Ruby?', level: 3, category_id: categories[0].id },
                      { title: 'Есть ли такой динозавр?', level: 1, category_id: categories[3].id }])

questions = Question.create!([{ text: 'Как насчет стегозавра?', test_id: tests[2].id },
                              { text: 'Есть ли бронтонетодатозавр?', test_id: tests[2].id },
                              { text: 'Что такое лямбда?', test_id: tests[1].id },
                              { text: 'В чем отличие метода с ! от метода без ! ?', test_id: tests[2].id }])

answers = Answer.create!([{ text: 'Да', correct: true, question_id: questions[0].id },
                          { text: 'Нет', question_id: questions[0].id },
                          { text: 'Да', question_id: questions[1].id },
                          { text: 'Нет', correct: true, question_id: questions[1].id },
                          { text: 'Элемент класса Proc', correct: true, question_id: questions[2].id },
                          { text: 'Конструкция, которая используется для работы с замыканиями',
                            correct: true, question_id: questions[2].id },
                          { text: 'Один из видов блоков', correct: true, question_id: questions[2].id },
                          { text: 'На методы, которые заканчиваются на ! надо обратить особое внимание',
                            question_id: questions[3].id },
                          { text: 'Методы c ! выполняют постоянное или потенциально опасное изменение',
                            correct: true, question_id: questions[3].id },
                          { text: '! ничего не говорит о работе методов', question_id: questions[3].id }])

users = User.create!([{ name: 'Иван', login: 'ivan1', password: '123456' ,
                        email: 'ivan@ivan.ru', role: 'user' },
                      { name: 'Петр', login: 'petr1', password: 'qwerty',
                        email: 'petr@petya.com', role: 'admin' },
                      { name: 'Иван Петров', login: 'ivpet', password: '123qwe',
                        email: 'petrushka@mail.com', role: 'user' }])
Participation.create!([{ user_id: users[0], test_id: tests[0].id },
                     { user_id: users[0].id, test_id: tests[1].id },
                     { user_id: users[1], test_id: tests[1].id },
                     { user_id: users[2], test_id: tests[0].id },
                     { user_id: users[2], test_id: tests[1].id },
                     { user_id: users[2], test_id: tests[2].id }])
