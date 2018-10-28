namespace :motc do
	desc "建立觀光景點資料"
  task :scenic_spot_init => :environment do
    app_id = ENV['MOTC_L2_ID']
    app_key = ENV['MOTC_L2_KEY']
    motc = MotcService.new(app_id, app_key)

    top = 30
    count = 0
    size = top + 1
    until size < top
      skip = count * top
      url = "/Tourism/ScenicSpot?$select=Name%2C%20DescriptionDetail%2C%20Description%2C%20Phone%2C%20Address%2C%20OpenTime%2C%20Position%2C%20City%2C%20TravelInfo%2C%20Picture&$top=#{top}&$skip=#{skip}&$format=JSON"
      scenic_spots = motc.get(url)
      scenic_spots.each do |scenic_spot|
        ss = ScenicSpot.create(scenic_spot_params(scenic_spot))
        ss.scenic_spot_photos.create({path: scenic_spot['Picture']['PictureUrl1'], description: scenic_spot['Picture']['PictureDescription1']}) if scenic_spot['Picture']['PictureUrl1'] && scenic_spot['Picture']['PictureDescription1']
        ss.scenic_spot_photos.create({path: scenic_spot['Picture']['PictureUrl2'], description: scenic_spot['Picture']['PictureDescription2']}) if scenic_spot['Picture']['PictureUrl2'] && scenic_spot['Picture']['PictureDescription2']
        ss.scenic_spot_photos.create({path: scenic_spot['Picture']['PictureUrl3'], description: scenic_spot['Picture']['PictureDescription3']}) if scenic_spot['Picture']['PictureUrl3'] && scenic_spot['Picture']['PictureDescription3']
      end
      count += 1
      size = scenic_spots.size
      puts count
    end
  end
  
  def scenic_spot_params(json)
    {
      name: json['Name'],
      description_detail: json['DescriptionDetail'],
      description: json['Description'],
      phone: json['Phone'],
      address: json['Address'],
      open_time: json['OpenTime'],
      lat: json['Position']['PositionLat'],
      lng: json['Position']['PositionLon'],
      city: json['City'],
      travel_info: json['TravelInfo'],
    }
  end
end
