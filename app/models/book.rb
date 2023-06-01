class Book < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :rentals
  validates :title, :author, :image_url, presence: true
  pg_search_scope :search_by_title_and_author,
                  against: [ :title, :author ],
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }
end
