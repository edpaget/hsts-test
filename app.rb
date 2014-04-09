require 'sinatra'

APP_ROOT = File.dirname(__FILE__)

class HSTSTest < Sinatra::Application
  set :root, APP_ROOT

  get '/' do
    content_type "text/plain"
    response.headers["Strict-Transport-Security"] = 'max-age=65474048'
    "Hey this should be secure!"
  end
end
