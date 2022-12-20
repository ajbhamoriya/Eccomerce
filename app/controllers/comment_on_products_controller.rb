class CommentOnProductsController < ApplicationController
	def create
      #byebug
    	#@product = Product.find(params[:product_id])
      #byebug
    	@comment = CommentOnProduct.create(comment_params)
      product_id = @comment.product_id
      @product = Product.find(product_id)
    	redirect_to product_details_home_path(@product)
  end

  def destroy
    #byebug
    #@product = Product.find(params[:product_id])
    @comment = CommentOnProduct.find(params[:id])
    product_id = @comment.product_id
    @product = Product.find(product_id)
    user_id = @comment.user_id
    if current_user.id == user_id
      @comment.destroy
      flash[:notice] = "you successfully delete this comment"
    else
      flash[:alert] = "you can't delete this comment"
    end
    redirect_to product_details_home_path(@product)
  end

  def like_comment
    #byebug
    @comment = CommentOnProduct.find(params[:id])
    product_id = @comment.product_id
    @like = Like.create(user_id: current_user.id, likeable_type: CommentOnProduct, likeable_id: @comment.id)
    redirect_to product_details_home_path(product_id) 
  end
 
  def dislike_comment
    #byebug
    @like = Like.find_by(id: params[:id])
    likeable_id = @like.likeable_id
    @comment = CommentOnProduct.find(likeable_id)
    product_id = @comment.product_id
    @like.destroy
    redirect_to product_details_home_path(product_id)
  end

  private
    def comment_params
      params.require(:comment_on_products).permit(:description,:user_id, :product_id, :reply_id)
    end

end
