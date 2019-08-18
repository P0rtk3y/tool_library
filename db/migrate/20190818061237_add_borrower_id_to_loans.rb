class AddBorrowerIdToLoans < ActiveRecord::Migration[5.2]
  def change
    add_column :loans, :borrower_id, :integer
  end
end
