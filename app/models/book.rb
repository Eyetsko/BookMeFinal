class Book < ApplicationRecord
  belongs_to :user
  has_many :rentals
  validates :title, :author, presence: true
end
