class LineItem < ApplicationRecord
  belongs_to :service
  belongs_to :cart, optional: true
  belongs_to :booking, optional: true

  def total_price
    self.quantity * self.service.price
  end

end
