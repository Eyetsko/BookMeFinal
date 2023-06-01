
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
