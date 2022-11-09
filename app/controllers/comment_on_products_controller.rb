class CommentOnProductsController < ApplicationController
	  def create
    	#byebug
      #@product = Product.find(params[:product_id])
    	@comment = CommentOnProduct.create(comment_params)
      product_id = @comment.product_id
      @product = Product.find(product_id)
      redirect_to product_detail_home_path(@product)
    end

  private
    def comment_params
      params.require(:comment_on_products).permit(:description,:user_id, :product_id)
    end

end
