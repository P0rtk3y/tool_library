class RemoveBorrowedOnFromTools < ActiveRecord::Migration[5.2]
  def change
    remove_column :tools, :borrowed_on
  end
end
