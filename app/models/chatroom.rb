class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :user
  validates :name, presence: true
end
