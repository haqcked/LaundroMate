class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
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
        item.cart_id = nil
        item.save!
      end
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:delivery_date, :pickup_date, :price)
  end

end
