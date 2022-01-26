class CreateCustomPlants < ActiveRecord::Migration[5.2]
  def change
    create_table :custom_plants do |t|

      t.timestamps
    end
  end
end
