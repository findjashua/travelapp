request = require 'request'

prefix = 'https://www.googleapis.com/customsearch/v1?'
apiKey = 'AIzaSyAich_IdDKurJdZqpUuvvzl_5A_4IiylEM'
cseId = '010026617731786985188:slp4zesmd5g'
baseUrl = "#{prefix}key=#{apiKey}&cx=#{cseId}&searchType=image&alt=json"

exports.listPlaces = (req, res)->
	location = req.params.location
	url = "#{baseUrl}&q=#{location}"
	request.get url, (err, resp, body)->
		return res.send err if err?
		json = JSON.parse(body)
		items = json.items
		links = []
		for item in items
			links.push item.link
		res.send links


