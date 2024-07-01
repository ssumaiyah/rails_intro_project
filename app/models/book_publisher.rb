class BookPublisher < ApplicationRecord
  belongs_to :book
  belongs_to :publisher

  validates :book_id, presence: true
  validates :publisher_id, presence: true
end
