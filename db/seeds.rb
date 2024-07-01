require 'faker'

# Clear existing data
BookGenre.destroy_all
BookPublisher.destroy_all
Book.destroy_all
Author.destroy_all
Genre.destroy_all
Publisher.destroy_all

# Create Authors
10.times do
  author_name = Faker::Book.author
  Author.create_with(name: author_name).find_or_create_by!(name: author_name)
end

# Create Genres
10.times do
  genre_name = Faker::Book.genre
  Genre.create_with(name: genre_name).find_or_create_by!(name: genre_name)
end

# Create Publishers
10.times do
  publisher_name = Faker::Book.publisher
  Publisher.create_with(name: publisher_name).find_or_create_by!(name: publisher_name)
end

# Create Books with associations
50.times do
  author = Author.all.sample
  book = author.books.create!(
    title: Faker::Book.title
  )

  # Associate books with genres
  genres = Genre.all.sample(rand(1..3))
  genres.each do |genre|
    BookGenre.find_or_create_by!(book: book, genre: genre)
  end

  # Associate books with publishers
  publishers = Publisher.all.sample(rand(1..2))
  publishers.each do |publisher|
    BookPublisher.find_or_create_by!(book: book, publisher: publisher)
  end
end
