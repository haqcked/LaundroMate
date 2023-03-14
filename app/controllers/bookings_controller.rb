class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(user_id: current_user.id).all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save!
      @current_cart.line_items.each do |item|
        item.booking = @booking
        # item.service.price = @booking.total_price
        item.cart_id = nil
        item.save!
        raise
      end
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to bookings_path(@booking)
    else
      render :new
    end
  end

  def destroy
    raise
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:delivery_date, :pickup_date, :total_price)
  end
end
