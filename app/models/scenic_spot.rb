class ScenicSpot < ApplicationRecord
  has_many :scenic_spot_photos,dependent: :destroy
end
