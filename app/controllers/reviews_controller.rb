class ReviewsController < ApplicationController

 def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = @recipe.reviews.build(review_params)
    @review.chef = current_user

	if @review.save
		flash[:success] = "Review was created succesfully"
    	redirect_to recipe_path(@recipe)
    else
		flash[:danger] = "The review could not be created"
		redirect_to :back
	end
 end
 
 
  private
    def review_params
      params.require(:review).permit(:body)
    end
end