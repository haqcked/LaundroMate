class ServicesController < ApplicationController

  def index
    @user = current_user
    @services = Service.all
    @cart = @current_cart
    @booking = Booking.new
  end
end
