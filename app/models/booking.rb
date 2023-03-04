class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :service
  has_many :reviews

  validates :pickup_date, presence: true
  validates :pickup_time, presence: true
  validates :delivery_date, presence: true
  validates :delivery_time, presence: true
  # validates :total_price, presence: true

end
