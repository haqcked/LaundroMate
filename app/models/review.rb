class Review < ApplicationRecord
  belongs_to :user
  belongs_to :booking

  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :comment, presence: true

  def self.highest_rated(limit)
    order(rating: :desc).limit(limit)
  end
end
