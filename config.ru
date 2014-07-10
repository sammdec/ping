require 'rubygems'
require 'bundler'
Bundler.require

# redis
$redis = Redis.new(url: ENV['REDIS_URL'])

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