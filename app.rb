require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @all_venues = Venue.all()
  erb(:main)
end

post('/add_venue') do
  new_venue_name = params.fetch("new_venue_name")
  Venue.create({:name => new_venue_name})
  @all_venues = Venue.all()
  redirect ('/')
end
