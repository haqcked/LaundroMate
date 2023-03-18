class CartsController < ApplicationController
  def show
    @user = current_user
    @cart = @current_cart
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to services_path
  end
end
