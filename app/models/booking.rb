class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :service
  has_many :reviews
  has_many :line_items, dependent: :destroy

  # validates :pickup_date, presence: true
  # validates :pickup_time, presence: true
  # validates :delivery_date, presence: true
  # validates :delivery_time, presence: true
  # validates :total_price, presence: true

  enum status: { pending: 0, processing_payment: 1, confirmed: 2, cancelled: 3, review: 4 }

end
