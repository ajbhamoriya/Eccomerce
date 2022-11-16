class Product < ApplicationRecord
  #include  ActiveStorageSuppport::SupportForBase64
  validates :category_id, presence: true
  belongs_to :category
  #has_one_base64_attached :image
  has_one_attached :image
  validates :name,:price,:stock_quantity,:image, presence: true
  has_many :likes, as: :likeable
  has_many :comment_on_products,dependent: :destroy
end
