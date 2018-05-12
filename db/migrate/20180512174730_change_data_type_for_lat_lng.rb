class ChangeDataTypeForLatLng < ActiveRecord::Migration[5.2]
  def change
    change_column(:news_feeds, :lat, :float)
    change_column(:news_feeds, :lng, :float)
    change_column(:scenic_spots, :lat, :float)
    change_column(:scenic_spots, :lng, :float)
  end
end
