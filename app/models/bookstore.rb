class Bookstore < ApplicationRecord
    validates :name, presence: true
    validates :address, presence: true
    validates :latitude, presence: true
    validates :longitude, presence: true
    
    has_many :books, dependent: :destroy
  
    # Example of adding description attribute
    attribute :description, :text
  end
  