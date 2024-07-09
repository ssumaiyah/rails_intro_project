class BookGenre < ApplicationRecord
  belongs_to :book
  belongs_to :genre

  validates :book_id, presence: true
  validates :genre_id, presence: true
  
  def self.ransackable_attributes(auth_object = nil)
    ["id","book_id","genre_id","created_at","updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["book","genre"]
  end
end
