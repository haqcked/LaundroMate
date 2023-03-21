class LineItemsController < ApplicationController

  def create
    # Find associated product and current cart
    chosen_service = Service.find(params[:line_item][:service_id])
    current_cart = @current_cart

    unless current_cart.services.include?(chosen_service)
      @line_item = LineItem.new
      @line_item.cart = current_cart
      @line_item.service = chosen_service
      @line_item.save
    end
    # Save and redirect to cart show path
    # this may be deleted and let STIMULUS handle the toggle for the off canvas
    redirect_to services_path
  end

  def show
    @line_item = LineItem.find(params[:id])
  end

  def destroy
    # raise
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to services_path
  end

  private

  def line_item_params
    params.require(:line_item).permit(:quantity, :service_id, :cart_id)
  end
end
