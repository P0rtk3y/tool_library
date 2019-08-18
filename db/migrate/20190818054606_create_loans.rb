class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.datetime :loaned_on
      t.integer :duration
      t.string :project_name
      t.belongs_to :tool, foreign_key: true
      t.belongs_to :borrower, foreign_key: true
      t.timestamps
    end
  end
end
