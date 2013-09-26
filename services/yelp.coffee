client = require('yelp').createClient
	consumer_key: 'gbotFxOuz4cfWFVQlckEng'
	consumer_secret: '2CYGN272ax7piskEROYT_L7PkjU'
	token: 'z7fsis3yAPVnTzIbh1xExNdinWD038yc'
	token_secret: 'CourDxGdRQiBgelb9HuNpj4vknY'

exports.listPlaces = (req, res) ->
	client.search req.params, (err, data)->
		return res.send err if err?
		places = []
		for business in data.businesses
			info = {}
			info.name = business.name
			info.rating = business.rating
			places.push info
		res.send places

