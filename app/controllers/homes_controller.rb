class HomesController < ApplicationController
	before_action :authenticate_user!
	
	def index
		if user_signed_in?
      		@categories = Category.all
      		@name = current_user.email
      		#render json: @categories
      		#render json: @name
    	end
  end	

	def show
		@category = Category.find(params[:id])
		@products = @category.products
		#render json: @products
	end	
	
	def category_search
  		q = params[:name]
    	@categories = Category.where("name LIKE ?", "%#{q}%")
    	render :index
  	end

  	def product_search
  		p = params[:name]
  		@products = Product.where("name LIKE ?", "%#{p}%")
  		render 'show'
 	end
    
    def like_product
    	#byebug
    	@product = Product.find_by(id: params[:id])
    	#if current_user.likes.exists?(likeable_id: @product.id)
    	#redirect_to home_path(@product.category)
		#flash[:alert] = "this item is already added in your wishlist."
		#else
        @like = Like.create(user_id: current_user.id, likeable_type: Product, likeable_id: @product.id) 
        redirect_to home_path(@product.category)
	    flash[:alert] = "item added succesfully!!!!!"
    end

    def dislike_product
    	@like = Like.find_by(id: params[:id])
    	likeable_id = @like.likeable_id
    	@product = Product.find(likeable_id)
    	#byebug
        #like = current_user.likes.where(likeable_id: @product.id)
        #Like.destroy(like)
        @like.destroy
        redirect_to home_path(@product.category)
	    flash[:alert] = "item removed succesfully!!!!!"
   end
 
end
