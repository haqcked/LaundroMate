class AddressesController < ApplicationController
  def edit
    @booking = Booking.find(params[:booking_id])
  end

  def update
    @booking = Booking.find(params[:booking_id])
    current_user.update(address: params[:user][:address])
    redirect_to booking_path(@booking)
  end
end
