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

tests = Test.create!([{ title: 'Кто что снял?', level: 2, category_id: categories[4] },
                      { title: 'Как хорошо вы знаете Ruby?', level: 3, category_id: categories[0] },
                      { title: 'Есть ли такой динозавр?', level: 1, category_id: categories[3] }])

questions = Question.create!([{ text: 'Как насчет стегозавра?', test_id: tests[2] },
                              { text: 'Есть ли бронтонетодатозавр?', test_id: tests[2] },
                              { text: 'Что такое лямбда?', test_id: tests[1] },
                              { text: 'В чем отличие метода с ! от метода без ! ?', test_id: tests[2] }])

answers = Answer.create!([{ text: 'Да', correct: true, question_id: questions[0] },
                          { text: 'Нет', question_id: questions[0] },
                          { text: 'Да', question_id: questions[1] },
                          { text: 'Нет', correct: true, question_id: questions[1] },
                          { text: 'Элемент класса Proc', correct: true, question_id: questions[2] },
                          { text: 'Конструкция, которая используется для работы с замыканиями',
                            correct: true, question_id: questions[2]},
                          { text: 'Один из видов блоков', correct: true, question_id: questions[2] },
                          { text: 'На методы, которые заканчиваются на ! надо обратить особое внимание',
                            question_id: questions[3]},
                          { text: 'Методы c ! выполняют постоянное или потенциально опасное изменение',
                            correct: true, question_id: questions[3]},
                          { text: '! ничего не говорит о работе методов', question_id: questions[3] }])

users = User.create!([{ name: 'Иван', login: 'ivan1', password: '123456' ,
                        email: 'ivan@ivan.ru', role: 'user' },
                      { name: 'Петр', login: 'petr1', password: 'qwerty',
                        email: 'petr@petya.com', role: 'admin' },
                      { name: 'Иван Петров', login: 'ivpet', password: '123qwe',
                        email: 'petrushka@mail.com', role: 'user' }])
TestExperience.create!([{ user: users[0], passed: tests[0] },
                     { user: users[0], test: tests[1] },
                     { user: users[1], test: tests[1] },
                     { user: users[2], test: tests[0] },
                     { user: users[2], test: tests[1] },
                     { user: users[2], test: tests[2] }])
