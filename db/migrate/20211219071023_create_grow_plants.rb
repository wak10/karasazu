class CreateGrowPlants < ActiveRecord::Migration[5.2]
  def change
    create_table :grow_plants do |t|
      t.integer :plant_id
      t.integer :user_id
      t.string :nick_name
      t.timestamps
    end
  end
end
