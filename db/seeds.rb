require 'faker'

# Clear existing data
Author.destroy_all
Book.destroy_all
Genre.destroy_all
Publisher.destroy_all
BookGenre.destroy_all
BookPublisher.destroy_all

# Create Authors
10.times do
  Author.create!(name: Faker::Book.author)
end

# Create Genres
10.times do
  Genre.create!(name: Faker::Book.genre)
end

# Create Publishers
10.times do
  Publisher.create!(name: Faker::Book.publisher)
end

# Create Books and associate them with Authors, Genres, and Publishers
50.times do
  book = Book.create!(
    title: Faker::Book.title,
    author: Author.all.sample
  )

  # Associate books with genres
  genres = Genre.all.sample(rand(1..3))
  genres.each do |genre|
    BookGenre.create!(book: book, genre: genre)
  end

  # Associate books with publishers
  publishers = Publisher.all.sample(rand(1..2))
  publishers.each do |publisher|
    BookPublisher.create!(book: book, publisher: publisher)
  end
end
