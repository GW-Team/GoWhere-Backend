require 'net/http'
require 'active_support/core_ext/time'
require 'json'


app_id = "[APP ID]"
app_key = "[APP KEY]"
count = 0

while true
  x_date = Time.now.getgm.strftime("%a, %d %b %Y %H:%M:%S GMT")
  signature = Base64.encode64(OpenSSL::HMAC.digest('sha1', app_key, "x-date: #{x_date}")).strip
  auth = "hmac username=\"#{app_id}\", algorithm=\"hmac-sha1\", headers=\"x-date\", signature=\"#{signature}\""
  
  uri = URI("http://ptx.transportdata.tw/MOTC/v2/Tourism/ScenicSpot?$select=Name, DescriptionDetail, Description, Phone, Address, OpenTime, City, TravelInfo, Position&$orderby=ID&$top=30&$skip=#{count}&$format=JSON")
  req = Net::HTTP::Get.new(uri)
  req['Authorization'] = auth
  req['x-date'] = x_date
  
  res = Net::HTTP.start(uri.hostname, uri.port) {|http|
    http.request(req)
  }
  
  res_json = JSON.parse(res.body)
  
  for item in res_json
    ScenicSpot.create(
      name: item['Name'],
      description: item['Description'],
      description_detail: item['DescriptionDetail'],
      phone: item['Phone'],
      address: item['Address'],
      open_time: item['OpenTime'],
      lat: item['Position']['PositionLat'],
      lng: item['Position']['PositionLon'],
      city: item['City'],
      travel_info: item['TravelInfo']
    )
  end
  
  break if res_json.length < 30
  count += 30
  puts count
end