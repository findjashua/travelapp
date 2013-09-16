yelp = require('./services/yelp')
google = require('./services/google')

exports.yelp = (req, res) ->
	yelp.getNames req.body, (err, data)->
		respond err, data, res

exports.google = (req, res) ->
	google.getImages req.body, (err, data)->
		respond err, data, res

respond = (err, data, res) ->
	res.send err if err?
	res.send data 


		
		
	
	
