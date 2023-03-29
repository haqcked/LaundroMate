class LineItemsController < ApplicationController

  def create
    chosen_service = Service.find(params[:line_item][:service_id])
    current_cart = @current_cart

    unless current_cart.services.include?(chosen_service)
      @line_item = LineItem.new
      @line_item.cart = current_cart
      @line_item.service = chosen_service
      @line_item.save
    end
    render json: @line_item
  end

  def show
    @line_item = LineItem.find(params[:id])
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to services_path
  end

  private

  def line_item_params
    params.require(:line_item).permit(:quantity, :service_id, :cart_id)
  end
end
