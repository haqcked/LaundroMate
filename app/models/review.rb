class Review < ApplicationRecord
  belongs_to :user
  belongs_to :booking

  validates :comment, length: {minimum: 20}

end
