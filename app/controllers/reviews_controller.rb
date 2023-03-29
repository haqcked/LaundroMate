class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to bookings_path, notice: 'Review successfully created!'
    else
      redirect_to bookings_path, alert: 'Error creating review'
    end
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :booking_id, :user_id)
  end
end
