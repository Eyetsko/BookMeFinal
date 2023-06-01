# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# puts "generating books"
# 10.times do
#   User.create(email: "#{Faker::Name.first_name}@gmail.com", password: "123456")
#     5.times do
#       Book.create(title: Faker::Book.title, author: Faker::Book.author, image_url: "https://edit.org/images/cat/book-covers-big-2019101610.jpg", user_id: User.all.sample.id)
#     end
#   end
# puts "created 10 books"
require "json"
require "open-uri"

url = "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=X8c8DIavp5Ukl8yHfxxATRA5SwlvSPwZ"
books_serialized = URI.open(url).read
books = JSON.parse(books_serialized)

all_books = books["results"]["books"]
all_books.each do | book |
  book.each do
    puts book["title"]
    puts book["author"]
    puts book["description"]
  end
end
