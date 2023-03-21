class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
end
