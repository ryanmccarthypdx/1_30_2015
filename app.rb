require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @all_venues = Venue.all()
  @all_bands = Band.all()
  @title = "Tour Manager"
  erb(:main)
end

post('/add_venue') do
  new_venue_name = params.fetch("new_venue_name")
  Venue.create({:name => new_venue_name})
  redirect ('/')
end

post('/add_band') do
  @new_band_name = params.fetch("new_band_name")
  @title = ("Book dates for ").concat(@new_band_name)
  erb(:band)
end

post('/book_tour') do
  venue_ids = params.fetch('venue_ids_array')
  new_band_name = params.fetch("new_band_name")
  Band.create({:name => new_band_name, :venue_ids => venue_ids})
  redirect ('/')
end
