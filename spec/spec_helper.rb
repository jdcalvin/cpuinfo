require 'json'

require 'rack/test'
require './app.rb'

include Rack::Test::Methods

def app
  ::CpuInfo
end

def format_response
  JSON.parse(last_response.body)
end