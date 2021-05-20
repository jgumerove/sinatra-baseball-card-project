class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :player_name
      t.string :brand
      t.integer :year
      t.integer :grade
      t.text :note
      t.integer :price 
      t.timestamps null: false
    end
  end
end
