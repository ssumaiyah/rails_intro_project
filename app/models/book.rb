class Book < ApplicationRecord
  belongs_to :author
  has_many :book_genres
  has_many :genres, through: :book_genres
  has_many :book_publishers
  has_many :publishers, through: :book_publishers

  validates :title, presence: true
  validates :author_id, presence: true
end
