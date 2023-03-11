class LineItem < ApplicationRecord
  belongs_to :service
  belongs_to :cart
  belongs_to :booking

  def total_price
    self.quantity * self.product.price
  end
  
end
