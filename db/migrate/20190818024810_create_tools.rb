class CreateTools < ActiveRecord::Migration[5.2]
  def change
    create_table :tools do |t|
      t.string "name"
      t.string "description"
      t.integer "library_id"
      t.boolean "in_library"
      t.datetime "borrowed_on"
      t.timestamps
    end
  end
end
