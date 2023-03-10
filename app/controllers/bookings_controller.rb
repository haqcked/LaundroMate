class BookingsController < ApplicationController

  def show
    @booking = Booking.new(service: @service, user: current_user)
  end

  def new
    @booking = Booking.new
    @services = Service.all
  end

  def create
    @booking = Booking.new
    if @booking.save!
      redirect_to bookings_path
    else
      render 'new'
    end
  end

end
