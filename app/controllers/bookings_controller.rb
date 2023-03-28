class BookingsController < ApplicationController

  def index
    @user = current_user
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
    @booking.total_price = 0
    if @booking.save!
      @current_cart.line_items.each do |item|
        item.booking = @booking
        @booking.total_price += item.service.price
        item.cart_id = nil
        item.save!
      end
      @booking.save!
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    # @line_items = LineItem.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update!(booking_params)
      redirect_to @booking
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  def redo
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to services_path

  end

  private

  def booking_params
    params.require(:booking).permit(:delivery_date, :pickup_date, :total_price)
  end
end
