class CommentOnProduct < ApplicationRecord
	belongs_to :product
	belongs_to :user
	has_many :replies, class_name: "CommentOnProduct",foreign_key: "reply_id"
	belongs_to :reply, class_name: "CommentOnProduct",optional: true
    validates :description, presence: true
    has_many :likes, as: :likeable
end
    #has_many :likes, as: :likeable, dependent: :destroy