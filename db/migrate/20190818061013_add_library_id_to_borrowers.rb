class AddLibraryIdToBorrowers < ActiveRecord::Migration[5.2]
  def change
    add_column :borrowers, :library_id, :integer
  end
end
