class Rental < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates :start_date, presence: true, comparison: { greater_than: Date.today }
  validates :end_date, presence: true, comparison: { greater_than: :start_date }

  def pending?
    status == 'Pending'
  end
end
