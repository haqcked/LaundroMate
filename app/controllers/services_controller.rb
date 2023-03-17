class ServicesController < ApplicationController

  def index
    @services = Service.all
    @cart = @current_cart
    @booking = Booking.new
  end
end
