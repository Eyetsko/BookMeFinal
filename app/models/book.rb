class Book < ApplicationRecord
  belongs_to :user
  has_many :rentals
  validates :title, :author, :image_url, presence: true
end
