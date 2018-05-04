class CreateAttractionPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :attraction_pictures do |t|
      t.references :attraction, foreign_key: true
      t.string :path

      t.timestamps
    end
  end
end
