class Product < ApplicationRecord
  validates :category_id, presence: true
  belongs_to :category
  has_one_attached :image
  validates :name,:price,:stock_quantity,:image, presence: true
  has_many :likes, as: :likeable
  has_many :comment_on_products,dependent: :destroy
end
