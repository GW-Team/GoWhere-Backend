class CreateAttractionPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :attraction_photos do |t|
      t.references :attraction, foreign_key: true
      t.string :path

      t.timestamps
    end
  end
end
