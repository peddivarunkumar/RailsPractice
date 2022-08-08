# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
articles = Article.create([{title: "Hello world",body: "Hello PeopleStrong"},{title: "Hey",body: "How are you"}])
puts articles.inspect

for i in 1..5
 comment = Comment.create({commenter: "vedant",body: "hi",article_id: rand(1..2)})
 puts comment.inspect
end

# rails db:drop db:create db:migrate db:seed