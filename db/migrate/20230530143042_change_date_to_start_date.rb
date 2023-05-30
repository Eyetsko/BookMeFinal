class ChangeDateToStartDate < ActiveRecord::Migration[7.0]
  def change
    rename_column :rentals, :date, :start_date
    add_column :rentals, :end_date, :date
  end
end
