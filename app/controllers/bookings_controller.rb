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
    @booking = Booking.new
    @current_cart.line_items.each do |item|
      @booking.line_items << item
      item.cart_id = nil
    end
    @booking.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    redirect_to services_path
  end

  # private
  # def booking_params
  #   params.require(:booking).permit(:service_id)
  # end

end
