class BookPublisher < ApplicationRecord
  belongs_to :book
  belongs_to :publisher

  validates :book_id, presence: true
  validates :publisher_id, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["id","book_id","publisher_id","created_at","updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["book","publisher"]
  end
  
end
