class Genre < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["id","title", "name","created_at","updated_at"]
  end

    has_many :book_genres
    has_many :books, through: :book_genres
  
    validates :name, presence: true, uniqueness: true
    def self.ransackable_associations(auth_object = nil)
      ["books"]
    end
  end
  