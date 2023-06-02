require "json"
require "open-uri"

puts "creating users"
User.create(email: "ana@email.com", password: "123456")
User.create(email: "esther@email.com", password: "123456")
User.create(email: "agustin@email.com", password: "123456")
User.create(email: "emily@email.com", password: "123456")
User.create(email: "dabin@email.com", password: "123456")
10.times do
  names = ['tom', 'john', 'michael', 'mariah', 'peter', 'brian', 'sarah', 'john', 'charles', 'joe']
  User.create(email: "#{names.sample}@email.com", password: "123456")
end

url = "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=X8c8DIavp5Ukl8yHfxxATRA5SwlvSPwZ"
books_serialized = URI.open(url).read
books = JSON.parse(books_serialized)
all_books = books["results"]["books"]
all_books.each do | book |
  Book.create(title: book["title"], author: book["author"], synopsis: book["description"], image_url: book['book_image'], user_id: User.all.sample.id)
end
puts "books created"
