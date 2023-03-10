class Service < ApplicationRecord
  has_many :bookings
  has_many :line_items, dependent: :destroy
end
