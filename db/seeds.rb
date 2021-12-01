# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!( [{title: 'Web'}, {title: 'Machine learning'}, {title: 'Ruby family'}] )
users = User.create!( [{name: 'User1', password: '123', access_admin: false}, {name: 'User2', password: '456', access_admin: false}, {name: 'Admin', password: 'admin', access_admin: true }] )
tests = Test.create!( [{title: 'HTML', level: 1, category: categories[0], author: users[2]}, {title: 'Python', level: 2, category: categories[1], author: users[2]}, {title: 'Ruby', level: 1, category: categories[2], author: users[2]}, {title: 'Rails', level: 2, category: categories[2], author: users[2]}] )
questions = Question.create!( [{text: 'Question1?', test: tests[0]}, {text: 'Question2?', test: tests[0]}, {text: 'Question1?', test: tests[1]}, {text: 'Question1?', test: tests[2]}, {text: 'Question1?', test: tests[3]}] )
Answer.create!([{ text: 'A', correct: false, question: questions[0] }, { text: 'B', correct: true, question: questions[0] }, { text: 'C', correct: true, question: questions[2]}, { text: 'B', correct: true, question: questions[4] }])
Result.create!([{ user: users[0], test: tests[0]},{ user: users[0], test: tests[1]},{ user: users[0], test: tests[2]}, { user: users[1], test: tests[2]}, { user: users[1], test: tests[3]}])

