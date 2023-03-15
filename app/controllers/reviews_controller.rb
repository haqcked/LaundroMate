class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = @booking.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to root_path, notice: "Review succesfully created"
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
