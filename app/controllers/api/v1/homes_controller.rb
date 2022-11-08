module Api
	module V1
		class HomesController < ApiController
		before_action :authenticate_user!
	
			def index
				#byebug
      			@categories = Category.all
      			#byebug
      			render json: @categories
        	end

        	def show
				@category = Category.find(params[:id])
				@products = @category.products
				render json: @products
			end	

			def category_search
  				q = params[:name]
    			@categories = Category.where("name LIKE ?", "%#{q}%")
    			render json: @categories
  			end

  			def product_search
  				p = params[:name]
  				@products = Product.where("name LIKE ?", "%#{p}%")
  				render json: @products
 			end
            
            def like_product
    			#byebug
    			@product = Product.find_by(id: params[:id])
    			if current_user.likes.exists?(likeable_id: @product.id)
    				redirect_to home_path(@product.category)
					flash[:alert] = "this item is already added in your wishlist."
				else
    				@like = Like.create(user_id: current_user.id, likeable_type: Product, likeable_id: @product.id) 
            		redirect_to home_path(@product.category)
					flash[:alert] = "item added succesfully!!!!!"
                end
    		end

        end
   	end
end

# module Api 
# 	module V1
#     	class HomeController < ApiController
#         	def index
# 			# byebug
# 			if current_user.user_type == "merchant"
# 				@products = current_user.products
# 				render json: @products
# 			else
# 				@products = Product.all
# 				render json: @products
# 			end
# 		end

