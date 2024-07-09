class Author < ApplicationRecord


  def self.ransackable_attributes(auth_object = nil)
    ["id","name","created_at","updated_at"]
  end

  has_many :books


  validates :name, presence: true, uniqueness: true
  
  def self.ransackable_associations(auth_object = nil)
    ["books"]
  end

end
