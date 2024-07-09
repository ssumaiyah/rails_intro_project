class Book < ApplicationRecord

  
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  
  def self.ransackable_attributes(auth_object = nil)
    ["id", "title", "author_id", "genre_id", "created_at", "updated_at", "bookstore_id"]
  end

  # Associations
  has_one_attached :cover_image
  belongs_to :author
  has_many :book_genres, dependent: :destroy
  has_many :genres, through: :book_genres
  has_one :book_publisher, dependent: :destroy
  has_one :publisher, through: :book_publishers
  has_many :bookstore_books
  has_many :bookstores, through: :bookstore_books

  # Validations
  validates :title, presence: true
  validates :author_id, presence: true

  # Method to display genre names as a comma-separated list
  def genre_names
    genres.pluck(:name).join(', ')
  end

  def self.ransackable_associations(auth_object = nil)
    ["author", "genres", "publisher", "bookstores"]
  end
end
