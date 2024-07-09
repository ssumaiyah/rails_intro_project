class Bookstore < ApplicationRecord

  def self.ransackable_attributes(auth_object = nil)
    ["id","name","address","created_at","updated_at","description"]  # Adjust this based on your actual associations
  end
    validates :name, presence: true
    validates :address, presence: true
    validates :latitude, presence: true
    validates :longitude, presence: true
    
  
    has_many :bookstore_books
    has_many :books, through: :bookstore_books
  
    # Example of adding description attribute
    attribute :description, :text

    def self.ransackable_associations(auth_object = nil)
      ["books"]
    end
 
  
end


  