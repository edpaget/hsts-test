require 'sinatra'
require 'secure_headers'

APP_ROOT = File.dirname(__FILE__)

::SecureHeaders::Configuration.configure do |config|
  config.hsts = {:max_age => 10000, :include_subdomains => true}
  config.x_frame_options = 'DENY'
  config.x_content_type_options = "nosniff"
  config.x_xss_protection = {:value => 1, :mode => false}
end

class HSTSTest < Sinatra::Application
  include SecureHeaders 
  set :root, APP_ROOT

  get '/' do
    set_hsts_header
    p headers
    content_type "text/plain"
    "Hey this should be secure!"
  end
end
