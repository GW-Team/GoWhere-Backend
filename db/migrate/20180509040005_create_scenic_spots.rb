class CreateScenicSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :scenic_spots do |t|
      t.string :name
      t.text :DescriptionDetail
      t.string :Description
      t.string :phone
      t.string :address
      t.string :OpenTime
      t.decimal :lat
      t.decimal :lng
      t.string :city
      t.text :TravelInfo


      t.timestamps
    end
  end
end
