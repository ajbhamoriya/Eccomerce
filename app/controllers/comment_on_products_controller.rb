class CommentOnProductsController < ApplicationController
	def create
    	@product = Product.find(params[:product_id])
    	@comment = @product.comment_on_products.create(comment_params)
    	redirect_to home_path(@product)
    end

  private
    def comment_params
      params.require(:comment_on_products).permit(:description,:user_id)
    end

end
