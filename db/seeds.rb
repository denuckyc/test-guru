# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'example@example.com', password: 'qwerty')

categories = Category.create([
                               { title: 'Ruby' },
                               { title: 'HTML und CSS' },
                               { title: 'SQL' }
                             ])

tests = Test.create([
                      { title: 'Basic Ruby', level: 1, category_id: categories[0].id, author_id: User.last.id },
                      { title: 'Advanced Ruby', level: 2, category_id: categories[0].id, author_id: User.last.id },
                      { title: 'Basic HTML und CSS', level: 1, category_id: categories[1].id, author_id: User.last.id },
                      { title: 'Normal SQL', level: 2, category_id: categories[2].id, author_id: User.last.id },
                      { title: 'Hard SQL', level: 3, category_id: categories[2].id, author_id: User.last.id }
                    ])

questions = Question.create([
                              { body: 'Чем отличается VARCHAR от NVARCHAR?', test_id: tests[3].id },
                              { body: 'BLA BLA BLA?', test_id: tests[0].id },
                              { body: 'В чем разница между проверкой block_given? и block.nil?', test_id: tests[1].id },
                              { body: 'Чем отличается puts от print?', test_id: tests[0].id },
                              { body: 'Расскажите, в каких случаях уместно использование элемента small.', test_id: tests[2].id }
                            ])

answers = Answer.create([
                          { body: 'Ничем', question_id: questions[2].id },
                          { body: 'puts добавляет новую строку в конец каждого аргумента, print не добавляет новую строку', correct: true, question_id: questions[2].id },
                          { body: 'Ничем', question_id: questions[0].id },
                          { body: 'varchar позволяет хранить строки в формате ASCII, где один символ занимает 1 байт, а nvarchar хранит строки в формате Unicode, где каждый символ занимает 2 байта', correct: true, question_id: questions[0].id },
                          { body: 'Нет разницы', question_id: questions[1].id },
                          { body: 'block_given? удобнее для понимания кода', correct: true, question_id: questions[1].id },
                          { body: 'Не знаю', question_id: questions[3].id },
                          { body: 'Юридические текст и прочее', correct: true, question_id: questions[3].id }
                        ])
