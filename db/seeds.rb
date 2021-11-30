# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

category_web = Category.create!( title: 'Web' )
category_ml = Category.create!( title: 'Machine learning' )
category_rf = Category.create!( title: 'Ruby family' )
user1 = User.create!( name: 'User1', password: '123', access_admin: false )
user2 = User.create!( name: 'User2', password: '456', access_admin: false )
admin = User.create!( name: 'Admin', password: 'admin', access_admin: true )
test_html = Test.create!( title: 'HTML', level: 1, category_id: category_web.id, author_id: admin.id )
test_python = Test.create!( title: 'Python', level: 2, category_id: category_ml.id, author_id: admin.id )
test_ruby = Test.create!( title: 'Ruby', level: 1, category_id: category_rf.id, author_id: admin.id  )
test_rails = Test.create!( title: 'Rails', level: 2, category_id: category_rf.id, author_id: admin.id  )
question1 = Question.create!( text: 'Question1?', test_id: test_html.id )
question2 = Question.create!( text: 'Question2?', test_id: test_html.id )
question3 = Question.create!( text: 'Question1?', test_id: test_python.id )
question4 = Question.create!( text: 'Question1?', test_id: test_ruby.id )
question5 = Question.create!( text: 'Question1?', test_id: test_rails.id )
Answer.create!([{ text: 'A', correct: false, question_id: question1.id }, { text: 'B', correct: true, question_id: question1.id }, { text: 'C', correct: true, question_id: question3.id }, { text: 'B', correct: true, question_id: question5.id }])
Result.create!([{ user_id: user1.id, test_id: test_html.id},{ user_id: user1.id, test_id: test_python.id},{ user_id: user1.id, test_id: test_ruby.id}, { user_id: user2.id, test_id: test_ruby.id}, { user_id: user2.id, test_id: test_rails.id}])

