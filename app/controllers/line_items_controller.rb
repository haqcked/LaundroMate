class LineItemsController < ApplicationController

  def create
    # Find associated product and current cart
    chosen_service = Service.find(params[:service_id])
    current_cart = @current_cart

    # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
    # if current_cart.services.include?(chosen_service)
    #   # Find the line_item with the chosen_product
    #   @line_item = current_cart.line_items.find_by(:service_id => chosen_service)
    #   # Iterate the line_item's quantity by one
    #   @line_item.quantity += 1
    # else
    #   @line_item = LineItem.new
    #   @line_item.cart = current_cart
    #   @line_item.service = chosen_service
    # end

    unless current_cart.services.include?(chosen_service)
      @line_item = LineItem.new
      @line_item.cart = current_cart
      @line_item.service = chosen_service
      @line_item.save
    end
    # Save and redirect to cart show path
    redirect_to cart_path(current_cart)
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to cart_path(@current_cart)
  end

  private
  def line_item_params
    params.require(:line_item).permit(:quantity, :service_id, :cart_id)
  end
end
