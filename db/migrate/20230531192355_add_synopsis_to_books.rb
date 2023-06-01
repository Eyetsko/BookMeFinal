class AddSynopsisToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :synopsis, :text
  end
end
