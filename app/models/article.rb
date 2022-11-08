class Article < ApplicationRecord
  has_many :comments
  validates :title, uniqueness: true
  validates :description, presence: true, length: {minimum: 5}
  #attr_accessor :text 
  before_validation :set_description

  def set_description
    puts "<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>"
    self.description = title.capitalize if description.blank?
  end
end
