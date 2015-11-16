namespace :scraper do

  desc "Scraping JSON API from 3taps.com"
  task scrape: :environment do
  	require "open-uri"
	require "json"

	auth_token = "51b31726d352aa5e7e9594b8b764237a"
	polling_url = "http://polling.3taps.com/poll"

	params = {
		auth_token: auth_token,
		anchor: 2403100034,
		source: "CARSD",
		category: "VAUT"
	}

	#Prepare API request
	uri = URI.parse(polling_url)
	uri.query = URI.encode_www_form(params)


	# Sumbit request
	result = JSON.parse(open(uri).read)
	# puts JSON.pretty_generate result


	result['postings'].each do |x|
		@post = Post.new
		@post.title = x['heading']
		@post.body  = x['annotations']['description']
		@post.price = x['annotations']['price']
		@post.external_url = x['external_url']
		@post.make = x['annotations']['make']
		@post.model = x['annotations']['model']
	  	@post.year = x['annotations']['year']
	  	@post.mileage = x['annotations']['mileage']
	  	@post.ext_color = x['annotations']['exteriorColor']
	  	@post.int_color = x['annotations']['interiorColor']
	  	@post.bodystyle = x['annotations']['bodyStyle']
	  	@post.door = x['annotations']['NumberOfDoors']
	  	@post.drivenwheels = x['annotations']['DrivenWheels']
      	@post.engine = x['annotations']['engine']
      	@post.vin = x['annotations']['vin']
      	@post.fuel = x['annotations']['fuel']
      	@post.timestamp = x['timestamp']
	    @post.save
	end

	puts "#{result['postings'].length} SAVED To DB !!!"
  end




  desc "TODO"
  task destroy_all_posts: :environment do
  end

end
