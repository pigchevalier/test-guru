# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([{ title: 'Web' }, { title: 'Machine learning' }, { title: 'Ruby family' }])
User.create([{ name: 'User1', password: '123', access_admin: false }, { name: 'User2', password: '456', access_admin: false }, { name: 'Admin', password: 'admin', access_admin: true }])
Test.create([{ title: 'HTML', level: 1, category_id: 1, author_id: 1 }, { title: 'Python', level: 2, category_id: 2, author_id: 2 }, { title: 'Ruby', level: 1, category_id: 3, author_id: 1 }, { title: 'Rails', level: 2, category_id: 3, author_id: 1 }])
Question.create([{ text: 'Question1?', test_id: 1}, { text: 'Question2?', test_id: 1}, { text: 'Question1?', test_id: 2}, { text: 'Question1?', test_id: 3}, { text: 'Question1?', test_id: 4}])
Answer.create([{ text: 'A', correct: false, question_id: 1 }, { text: 'B', correct: true, question_id: 1 }, { text: 'C', correct: true, question_id: 3 }, { text: 'B', correct: true, question_id: 5 }])

