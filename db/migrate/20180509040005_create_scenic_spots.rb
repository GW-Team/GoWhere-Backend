class CreateScenicSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :scenic_spots do |t|
      t.string :name
      t.text :description_detail
      t.string :description
      t.string :phone
      t.string :address
      t.string :open_time
      t.decimal :lat
      t.decimal :lng
      t.string :city
      t.text :travel_info


      t.timestamps
    end
  end
end
