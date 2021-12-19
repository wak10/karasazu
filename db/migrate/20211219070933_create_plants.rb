class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :plant_name
      t.string :image_id
      t.integer :frequency
      t.string :amount
      t.string :advice

      t.timestamps
    end
  end
end
