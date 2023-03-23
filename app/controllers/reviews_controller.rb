class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to @review.booking, notice: 'Review successfully created!'
    else
      redirect_to @review.booking, alert: 'Error creating review'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to @review.booking, notice: 'Review succesfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to @review.booking, notice: 'Review succesfully deleted!'
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :booking_id, :user_id)
  end
end
