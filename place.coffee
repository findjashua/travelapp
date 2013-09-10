yelp = require('yelp').createClient
	consumer_key: 'gbotFxOuz4cfWFVQlckEng'
	consumer_secret: '2CYGN272ax7piskEROYT_L7PkjU'
	token: 'z7fsis3yAPVnTzIbh1xExNdinWD038yc'
	token_secret: 'CourDxGdRQiBgelb9HuNpj4vknY'

exports.list = (req, res) ->
	yelp.search req.body, (err, data)->
		res.send err if err?
		places = []
		for business in data.businesses
			places.push business.id
		res.send places
	
	
