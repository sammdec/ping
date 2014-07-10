require 'rubygems'
require 'bundler'
Bundler.require

# redis
$redis = Redis.new(url: 'redis://redistogo:edbe9b02722f3c3b6c02daed375f70bc@angelfish.redistogo.com:10415/ping')

# assets
map '/assets' do
  sprockets = Sprockets::Environment.new
  sprockets.append_path 'assets/js'
  sprockets.append_path 'assets/css'
  run sprockets
end


# app
require './ping'
run Ping