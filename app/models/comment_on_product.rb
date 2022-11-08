class CommentOnProduct < ApplicationRecord
	belongs_to :Product
	belongs_to :user
end
