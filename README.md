# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
1. Authors Table
Description: This table stores information about authors of books.
Columns:
id: Primary key for the author.
name: Name of the author.
created_at, updated_at: Timestamps for record creation and updates.

2. Genres Table
Description: This table categorizes books into different genres.
Columns:
id: Primary key for the genre.
name: Name of the genre.
created_at, updated_at: Timestamps for record creation and updates.

3. Publishers Table
Description: This table stores information about publishers of books.
Columns:
id: Primary key for the publisher.
name: Name of the publisher.
created_at, updated_at: Timestamps for record creation and updates.

4. Books Table
Description: This table represents individual books.
Columns:
id: Primary key for the book.
title: Title of the book.
author_id: Foreign key linking to authors table to denote the author of the book.
genre_id: Foreign key linking to genres table to denote the genre of the book.
bookstore_id: Foreign key linking to bookstores table to denote where the book is available.
created_at, updated_at: Timestamps for record creation and updates.

5. BookGenres Table
Description: This join table establishes many-to-many relationships between books and genres.
Columns:
book_id: Foreign key referencing books table.
genre_id: Foreign key referencing genres table.
created_at, updated_at: Timestamps for record creation and updates.

6. BookPublishers Table
Description: This join table establishes many-to-many relationships between books and publishers.
Columns:
book_id: Foreign key referencing books table.
publisher_id: Foreign key referencing publishers table.
created_at, updated_at: Timestamps for record creation and updates.

7. Bookstores Table
Description: This table stores information about bookstores where books are available.
Columns:
id: Primary key for the bookstore.
name: Name of the bookstore.
address: Address of the bookstore.
latitude, longitude: Geographic coordinates of the bookstore.
created_at, updated_at: Timestamps for record creation and updates.

8. BookstoreBooks Table
Description: This join table establishes many-to-many relationships between books and bookstores.
Columns:
book_id: Foreign key referencing books table.
bookstore_id: Foreign key referencing bookstores table.
created_at, updated_at: Timestamps for record creation and updates.

Relationships:
1. Author-Book Relationship: Each book (books table) has exactly one author (authors table).
2. Genre-Book Relationship: Each book (books table) can belong to multiple genres through the book_genres join table (genres table).
3. Publisher-Book Relationship: Each book (books table) can have multiple publishers through the book_publishers join table (publishers table).
4. Bookstore-Book Relationship: Each book (books table) can be available at multiple bookstores through the bookstore_books join table (bookstores table).

Many-to-many relationships are managed using join tables (book_genres, book_publishers, bookstore_books).