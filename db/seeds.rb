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

users = User.create!([{ name: 'Иван', username: 'ivan1', password: '123456' ,
                        email: 'ivan@ivan.ru', role: 'admin' },
                      { name: 'Петр', username: 'petr1', password: 'qwerty',
                        email: 'petr@petya.com', role: 'user' },
                      { name: 'Иван Петров', username: 'ivpet', password: '123qwe',
                        email: 'petrushka@mail.com', role: 'user' }])

tests = Test.create!([{ title: 'Кто что снял?', level: 2, category: categories[4],
                        author: users[0] },
                      { title: 'Как хорошо вы знаете Ruby?', level: 3, category: categories[0],
                        author: users[0] },
                      { title: 'Есть ли такой динозавр?', level: 1, category: categories[3],
                        author: users[0] }])

questions = Question.create!([{ text: 'Как насчет стегозавра?', test: tests[2] },
                              { text: 'Есть ли бронтонетодатозавр?', test: tests[2] },
                              { text: 'Что такое лямбда?', test: tests[1] },
                              { text: 'В чем отличие метода с ! от метода без ! ?', test: tests[2] }])

answers = Answer.create!([{ text: 'Да', correct: true, question: questions[0] },
                          { text: 'Нет', question: questions[0] },
                          { text: 'Да', question: questions[1] },
                          { text: 'Нет', correct: true, question: questions[1] },
                          { text: 'Элемент класса Proc', correct: true, question: questions[2] },
                          { text: 'Конструкция, которая используется для работы с замыканиями',
                            correct: true, question: questions[2] },
                          { text: 'Один из видов блоков', correct: true, question: questions[2] },
                          { text: 'На методы, которые заканчиваются на ! надо обратить особое внимание',
                            question: questions[3] },
                          { text: 'Методы c ! выполняют постоянное или потенциально опасное изменение',
                            correct: true, question: questions[3] },
                          { text: '! ничего не говорит о работе методов', question: questions[3] }])

Participation.create!([{ user: users[0], test: tests[0] },
                       { user: users[0], test: tests[1] },
                       { user: users[1], test: tests[1] },
                       { user: users[2], test: tests[0] },
                       { user: users[2], test: tests[1] },
                       { user: users[2], test: tests[2] }])
