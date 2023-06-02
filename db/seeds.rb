require "json"
require "open-uri"
url = "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=X8c8DIavp5Ukl8yHfxxATRA5SwlvSPwZ"
books_serialized = URI.open(url).read
books = JSON.parse(books_serialized)
puts "starting"
all_books = books["results"]["books"]
all_books.each do | book |
  book.each do
    10.times do
      names = ['anna', 'sarah', 'tom', 'ashley', 'john', 'michael', 'mariah', 'peter', 'charles', 'brian']
      user = User.create(email: "#{names.sample}@email.com", password: "123456")
        5.times do
          Book.create(title: book["title"], author: book["author"], synopsis: book["description"], image_url: book['book_image'], user_id: user.id)
        end
      end
    end
end
puts "finished"
