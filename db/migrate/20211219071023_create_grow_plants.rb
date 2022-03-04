class CreateGrowPlants < ActiveRecord::Migration[5.2]
  def change
    create_table :grow_plants do |t|
      t.integer :plant_id
      t.integer :user_id
      t.string :image_id
      t.string :nick_name
      t.integer :place, null: false, default: 0

      t.string :plant_name
      t.integer :frequency
      t.string :amount
      t.string :advice
      t.timestamps
    end
  end
end
