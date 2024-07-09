class BookstoreBook < ApplicationRecord
  # Associations
  belongs_to :book
  belongs_to :bookstore

  # Validations
  validates :book_id, presence: true
  validates :bookstore_id, presence: true

  # Ransackable attributes
  def self.ransackable_attributes(auth_object = nil)
    ["id", "book_id", "bookstore_id", "created_at", "updated_at"] # Adjust based on your needs
  end
  def self.ransackable_associations(auth_object = nil)
    ["book","bookstore"]
  end
end
