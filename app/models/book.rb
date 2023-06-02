class Book < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  validates :title, :author, :image_url, presence: true
end
