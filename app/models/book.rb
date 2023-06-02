class Book < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  validates :title, :author, presence: true
end
