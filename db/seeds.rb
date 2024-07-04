require 'faker'

# Clear existing data
BookGenre.destroy_all
BookPublisher.destroy_all
BookstoreBook.destroy_all
Book.destroy_all
Author.destroy_all
Genre.destroy_all
Publisher.destroy_all
Bookstore.destroy_all

# Create Authors
authors = 80.times.map do
  author_name = Faker::Book.author
  Author.find_or_create_by!(name: author_name)
end

# Create Genres
genres = 50.times.map do
  genre_name = Faker::Book.genre
  Genre.find_or_create_by!(name: genre_name)
end

# Create Publishers
publishers = 70.times.map do
  publisher_name = Faker::Book.publisher
  Publisher.find_or_create_by!(name: publisher_name)
end

# Create Bookstores
bookstores = 150.times.map do
  Bookstore.create!(
    name: "#{Faker::Company.name} Bookstore",
    address: Faker::Address.full_address,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude
  )
end

# Create Books with associations
200.times do
  author = authors.sample
  book_title = Faker::Book.unique.title
  book = author.books.create!(
    title: book_title
  )

  # Associate books with genres
  genres.sample(rand(1..3)).each do |genre|
    BookGenre.find_or_create_by!(book: book, genre: genre)
  end

  # Associate books with publishers
  publishers.sample(rand(1..2)).each do |publisher|
    BookPublisher.find_or_create_by!(book: book, publisher: publisher)
  end

  # Associate books with bookstores
  bookstores.sample(rand(1..3)).each do |bookstore|
    BookstoreBook.find_or_create_by!(book: book, bookstore: bookstore)
  end
end

# Create AdminUser if it does not exist
unless AdminUser.exists?(email: 'admin@example.com')
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end
