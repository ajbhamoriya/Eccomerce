module Api
	module V1
		class HomesController < ApiController
			before_action :authenticate_user!
			def index
      			@categories = Category.all
      			render json: {result: @categories}, status: :ok
        	end

        	def show
				@category = Category.find(params[:id])
				@products = @category.products
				render json: @products
			end	

			def category_search
				#byebug
  				q = params[:name]
    			@categories = Category.where("name LIKE ?", "%#{q}%")
    			render json: @categories
  			end

  			def product_search
  				#byebug
  				p = params[:name]
  				@products = Product.where("name LIKE ?", "%#{p}%")
  				render json: @products
 			end
            
            def like_product
    			#byebug
    			@product = Product.find_by(id: params[:id])
    			#if current_user.likes.exists?(likeable_id: @product.id)
    			#redirect_to home_path(@product.category)
				#flash[:alert] = "this item is already added in your wishlist."
				#else
        		@like = Like.create(user_id: current_user.id, likeable_type: Product, likeable_id: @product.id) 
        		render json: {meta: {message: "like created"}}
    		end

    		def dislike_product
    			@like = Like.find_by(id: params[:id])
    			likeable_id = @like.likeable_id
    			@product = Product.find(likeable_id)
    			#byebug
       			#like = current_user.likes.where(likeable_id: @product.id)
        		#Like.destroy(like)
        		@like.destroy
        		render json: {meta: {message: "like deleted"}}
   			end

    		def product_details
   				@product = Product.find_by(id: params[:id])
   				render json: @product
    		end 
            
        end
   	end
end

