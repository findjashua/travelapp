yelp = require('./services/yelp').client

exports.list = (req, res) ->
	yelp.search req.body, (err, data)->
		res.send err if err?
		#res.send data 
		places = []
		for business in data.businesses
			places.push business.name
		res.send places
	
	
