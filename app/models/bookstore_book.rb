class BookstoreBook < ApplicationRecord
  # Associations
  belongs_to :book
  belongs_to :bookstore

  # Validations
  validates :book_id, presence: true
  validates :bookstore_id, presence: true
end
