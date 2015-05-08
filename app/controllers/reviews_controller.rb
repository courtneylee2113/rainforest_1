class ReviewsController < ApplicationController
 	before_filter :ensure_logged_in, only: [:create, :destroy]

  def show
  	@review =Review.find(params[:id])
  end

  def create
  	@review = @product.reviews.build(review_params)
  	@review.user = current_user

  	if @review.save
  		redirect_to products_path, notice: 'Reveiw was created successfully'
  	else
  		render 'products/show'
		end	
  end

  def destroy
  	@review = Reveiw.find(params[:id])
  	@review.destroy
  end

  private
  def review_params
  	params.require(:review).permit [:product_id]
  end

  def load_product
  	@product = Product.find(params[:product_id])
  end 
end

