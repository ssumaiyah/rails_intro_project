class Book < ApplicationRecord
  # Associations
  has_one_attached :cover_image
  belongs_to :author
  has_many :book_genres, dependent: :destroy
  has_many :genres, through: :book_genres
  has_many :book_publishers, dependent: :destroy
  has_many :publishers, through: :book_publishers

  # Validations
  validates :title, presence: true
  validates :author_id, presence: true

  # Method to display genre names as a comma-separated list
  def genre_names
    genres.pluck(:name).join(', ')
  end
end
