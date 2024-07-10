require 'uri'
require 'net/http'
require 'openssl'
require 'date'

class PropertiesController < ApplicationController
  protect_from_forgery
  attr_accessor :data
  
  def get


 begin
  require 'uri'
require 'net/http'

url = URI("https://api.stagingeb.com/v1/properties?page=1&limit=50")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["accept"] = 'application/json'
request["X-Authorization"] = 'l7u502p8v46ba3ppgvj5y2aad50lb9'

response = http.request(request)
data = JSON.parse(response.read_body)

@data = data['content']
  
  # render json: {"status" => response['status'], "message" => response['message'], "data" => data['content'].filter_map {|n| ['title' => n['title'] ]} }
rescue => e
  render json: ["status" => "400", "message" => e, "data" => []]
end
  
end
end
