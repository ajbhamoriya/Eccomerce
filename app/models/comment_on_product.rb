class CommentOnProduct < ApplicationRecord
	belongs_to :product
	belongs_to :user
	has_many :replies, class_name: "CommentOnProduct",foreign_key: "reply_id"
	belongs_to :reply, class_name: "CommentOnProduct",optional: true
    validates :description, presence: true
end
    #has_many :likes, as: :likeable, dependent: :destroy