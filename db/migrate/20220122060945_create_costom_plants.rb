class CreateCostomPlants < ActiveRecord::Migration[5.2]
  def change
    create_table :costom_plants do |t|
      t.integer :user_id
      t.string :plant_name
      t.string :image_id
      t.integer :frequency
      t.string :amount
      t.timestamps
    end
  end
end