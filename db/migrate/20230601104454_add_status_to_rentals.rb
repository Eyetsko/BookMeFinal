class AddStatusToRentals < ActiveRecord::Migration[7.0]
  def change
    add_column :rentals, :status, :string, default: "Pending"
  end
end
