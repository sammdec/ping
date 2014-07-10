desc "Ping app"
task ping_ping: :environment do
  uri = URI.parse('http://ping-steer.herokuapp.com/')
  Net::HTTP.get(uri)
end