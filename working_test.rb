require 'net/https'
require 'api-auth'
require 'time'
require 'json'

MINGLE_URL = "https://sarah.mingle-api.thoughtworks.com/api/v2/projects/clix/cards.xml"
uri = URI.parse(MINGLE_URL)
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

xml_data = %{
<?xml version='1.0' encoding='UTF-8'?>
  <card>
  	<name>Test POST Request</name>
  </card>
}

request = Net::HTTP::Post.new(uri.path)
request['Content-Type'] = 'application/XML'
request.body = xml_data

access_key_id='<user login>'
secret_access_key='<hmac key>'

ApiAuth.sign!(request, access_key_id, secret_access_key) 
response = http.request(request)

puts response.body
puts response.inspect