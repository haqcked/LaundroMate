class ServicesController < ApplicationController

  def index
    @user = current_user
    @services = Service.all

    @wash_dry_fold_services = @services.where(category: "Wash, Dry and Fold")
    @wash_dry_iron_services = @services.where(category: "Wash, Dry and Iron")
    @iron_services = @services.where(category: "Iron")

    @cart = @current_cart
    @booking = Booking.new
    @line_item = LineItem.new
  end
end
